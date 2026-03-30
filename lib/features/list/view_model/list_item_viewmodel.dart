import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radioapp/core/data/station.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/core/repository.dart';
import 'package:radioapp/core/view_model/station_viewmodel.dart';

part 'list_item_viewmodel.freezed.dart';

@freezed
abstract class ListItemState with _$ListItemState {
  const factory ListItemState({
    @Default(false) bool isBookmarked,
    @Default(false) bool isActive,
  }) = _ListItemState;
}

final listItemProvider =
    NotifierProvider.family<ListItemViewmodel, ListItemState, Station>(
      (s) => ListItemViewmodel(station: s),
    );

class ListItemViewmodel extends Notifier<ListItemState> {
  final Station station;
  late BookmarkRepository _bookmarkProvider;

  ListItemViewmodel({required this.station});
  @override
  ListItemState build() {
    _bookmarkProvider = ref.watch(bookmarkProvider);
    final steam = _bookmarkProvider.onBookmarkChanged((key) {
      if (key == _bookmarkProvider.getKey(station)) {
        state = state.copyWith(
          isBookmarked: _bookmarkProvider.isBookmarked(station),
        );
      }
    });

    ref.onDispose(() {
      steam.cancel();
    });
    final isActive = ref.watch(
      stationProvider.select(
        (s) => s.station?.stationuuid == station.stationuuid,
      ),
    );
    return ListItemState(
      isBookmarked: _bookmarkProvider.isBookmarked(station),
      isActive: isActive,
    );
  }

  void toggleBookmark(Station station) {
    _bookmarkProvider.toggleBookmark(station);
  }
}
