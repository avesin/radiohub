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
    state = state.copyWith(currentIndex: index);
  }

  void selectCountry(int index) {
    state = state.copyWith(
      selectedCountryIndex: index,
      selectedCountry: state.countries[index],
    );
  }

  void setLocation(LocationData location) {
    state = state.copyWith(location: location);
  }

  void setSelectedCountry(String? country) {
    List<String> countryList = state.countries;
    if (country == null) return;
    !countryList.contains(country) ? countryList.add(country) : null;
    state = state.copyWith(selectedCountry: country, countries: countryList);
  }
}
