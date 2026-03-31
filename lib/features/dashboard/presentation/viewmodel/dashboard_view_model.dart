import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/countries.dart';
import 'package:radioapp/core/repository.dart';
import 'package:radioapp/features/dashboard/data/dashboard_state.dart';

final dashboardProvider = NotifierProvider<DashboardViewModel, DashboardState>(
  DashboardViewModel.new,
);

class DashboardViewModel extends Notifier<DashboardState> {
  @override
  DashboardState build() {
    return DashboardState(countries: countries);
  }

  void changeTab(int index) {
    state = state.copyWith(currentIndex: index, locationError: null);
  }

  void selectCountry(int index) {
    final country = state.countries[index];
    print("Selected country: $country");
    state = state.copyWith(
      locationError: null,
      selectedCountryIndex: index,
      selectedCountry: country,
    );
  }

  void setLocation(LocationData location) {
    state = state.copyWith(
      locationError: null,
      location: location,
      selectedCountry: location.placemark.country ?? state.selectedCountry,
      selectedCountryIndex: location.placemark.country != null
          ? state.countries.indexOf(location.placemark.country!)
          : state.selectedCountryIndex,
    );
  }

  void setSelectedCountry(String? country) {
    List<String> countryList = state.countries;
    if (country == null) return;
    !countryList.contains(country) ? countryList.add(country) : null;
    final index = countryList.indexOf(country);
    state = state.copyWith(
      selectedCountry: country,
      selectedCountryIndex: index,
      countries: countryList,
      locationError: null,
    );
  }

  void setLocationError(String error) {
    state = state.copyWith(locationError: error);
  }
}
