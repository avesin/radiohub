import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radioapp/core/repository.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(0) int currentIndex,
    int? selectedCountryIndex,
    String? selectedCountry,
    LocationData? location,
    @Default([]) List<String> countries,
  }) = _DashboardState;
}
