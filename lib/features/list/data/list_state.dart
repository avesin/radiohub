import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radioapp/core/data/station.dart';

part 'list_state.freezed.dart';

@freezed
abstract class ListState with _$ListState {
  const factory ListState({
    @Default([]) List<Station> stations,
    String? error,
  }) = _ListState;
}
