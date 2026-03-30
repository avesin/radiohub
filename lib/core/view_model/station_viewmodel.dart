import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/features/list/data/station_state.dart';

final stationProvider = NotifierProvider<StationViewmodel, StationState>(
  StationViewmodel.new,
);

class StationViewmodel extends Notifier<StationState> {
  @override
  StationState build() {
    return StationState();
  }

  void selectStation(int index, station) {
    state = state.copyWith(selectedIndex: index, station: station);
  }

  void setPlayStation(station) {
    state = state.copyWith(playStation: station);
  }

  void setIsMute(bool isMute, double currentVolume) {
    state = state.copyWith(isMute: isMute, nonMuteVolume: currentVolume);
  }
}
