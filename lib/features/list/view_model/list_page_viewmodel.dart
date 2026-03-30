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
  String _country = '';
  double? _latitude;
  double? _longitude;

  @override
  Future<ListState> build() async {
    _country = ref.watch(
      dashboardProvider.select((s) => s.selectedCountry ?? ''),
    );
    final loc = ref.watch(dashboardProvider.select((s) => s.location));
    if (loc != null) {
      _latitude = loc.position.latitude;
      _longitude = loc.position.longitude;
    }

    if (_country.isEmpty) {
      final locationRepo = ref.read(locationRepositoryProvider);
      final location = await locationRepo.getLocations();
      _country = location.placemark.country ?? '';
      _latitude = location.position.latitude;
      _longitude = location.position.longitude;
    }
    return ListState().copyWith(stations: await fetchStations(_country));
  }

  Future<List<Station>> fetchStations(String? country) async {
    final repo = ref.read(radioRepositoryProvider);
    final pref = ref.read(encryptedPrefsProvider);
    if (country == null) {
      final locationRepo = ref.read(locationRepositoryProvider);
      final location = await locationRepo.getLocations();
      _country = location.placemark.country ?? '';
      _latitude = location.position.latitude;
      _longitude = location.position.longitude;
    }
    List<Station> stations = [];
    final now = DateTime.now().millisecondsSinceEpoch;
    int lasthit = await pref.getInt("last_hit", defaultValue: 0) ?? 0;
    if (pref.getKeys().contains(_country)) {
      stations = pref
          .getStringList(_country)!
          .map((s) => Station.fromJson(jsonDecode(s)))
          .toList();
    }
    if (stations.isEmpty || now - lasthit > 3600000) {
      stations = await repo.fetchStations(_country, _latitude, _longitude);
      await pref.setStringList(
        _country,
        stations.map((s) => jsonEncode(s.toJson())).toList(),
      );
      await pref.setInt("last_hit", now);
      print("Fetched ${now - lasthit} seconds 11111");
    }
    print("Fetched ${now - lasthit} seconds 22222");
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
