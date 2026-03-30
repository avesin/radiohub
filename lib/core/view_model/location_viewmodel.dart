import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/core/repository.dart';

final locationProvider = AsyncNotifierProvider<LocationViewModel, LocationData>(
  LocationViewModel.new,
);

class LocationViewModel extends AsyncNotifier<LocationData> {
  @override
  Future<LocationData> build() async {
    return getLocation();
  }

  Future<LocationData> getLocation() async {
    final repo = ref.read(locationRepositoryProvider);
    return repo.getLocations();
  }
}
