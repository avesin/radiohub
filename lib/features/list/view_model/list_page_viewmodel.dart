import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/data/station.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/features/dashboard/presentation/viewmodel/dashboard_view_model.dart';
import 'package:radioapp/features/list/data/list_state.dart';

final listPageProvider = AsyncNotifierProvider<ListPageViewmodel, ListState>(
  ListPageViewmodel.new,
);

class ListPageViewmodel extends AsyncNotifier<ListState> {
  static const int _maxLastHit = 3600000; // 1 hour in milliseconds
  String _country = '';
  double? _latitude;
  double? _longitude;

  @override
  Future<ListState> build() async {
    _country = ref.watch(
      dashboardProvider.select((s) => s.selectedCountry ?? ''),
    );
    print("ListPageViewmodel build called with country: $_country");
    final loc = ref.watch(dashboardProvider.select((s) => s.location));
    if (loc != null) {
      _latitude = loc.position.latitude;
      _longitude = loc.position.longitude;
    }
    print(
      "Building ListPageViewmodel with country: $_country, latitude: $_latitude, longitude: $_longitude",
    );
    return ListState().copyWith(
      stations: _country.isNotEmpty ? await fetchStations(_country) : [],
    );
  }

  Future<List<Station>> fetchStations(String? country) async {
    final repo = ref.read(radioRepositoryProvider);
    final pref = ref.read(encryptedPrefsProvider);
    if (country == null || _latitude == null || _longitude == null) {
      final locationRepo = ref.read(locationRepositoryProvider);
      final location = await locationRepo.getLocations();
      if (country != null) {
        _country = country;
      } else {
        _country = location.placemark.country ?? '';
      }

      _latitude = location.position.latitude;
      _longitude = location.position.longitude;
    }
    List<Station> stations = [];
    final now = DateTime.now().millisecondsSinceEpoch;
    int lasthit = await pref.getInt("last_hit_$_country", defaultValue: 0) ?? 0;
    if (pref.getKeys().contains(_country)) {
      stations = pref
          .getStringList(_country)!
          .map((s) => Station.fromJson(jsonDecode(s)))
          .toList();
    }
    print(
      "country: $_country, lasthit: $lasthit, now: $now, diff: ${now - lasthit}, data: ${stations.length}",
    );
    if (stations.isEmpty || now - lasthit > _maxLastHit) {
      stations = await repo.fetchStations(_country, _latitude, _longitude);
      await pref.setStringList(
        _country,
        stations.map((s) => jsonEncode(s.toJson())).toList(),
      );
      await pref.setInt("last_hit_$_country", now);
    }
    return stations;
  }

  Future<void> refresh() async {
    final current = state.value;
    state = const AsyncLoading();
    if (current == null) {
      state = AsyncData(
        ListState().copyWith(stations: await fetchStations(_country)),
      );
    } else {
      final stations = await fetchStations(_country);
      state = AsyncData(current.copyWith(stations: stations));
    }
  }
}
