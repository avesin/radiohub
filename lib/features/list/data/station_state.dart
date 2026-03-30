import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radioapp/core/data/station.dart';

part 'station_state.freezed.dart';

@freezed
abstract class StationState with _$StationState {
  const factory StationState({
    @Default(-1) int selectedIndex,
    @Default(null) Station? station,
    @Default(null) Station? playStation,
    @Default(0) double nonMuteVolume,
    @Default(false) bool isMute,
  }) = _StationState;
}
