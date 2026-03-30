import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/data/station.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/core/repository.dart';

final bookmarkViewmodelProvider =
    NotifierProvider<BookmarkViewmodel, List<Station>>(BookmarkViewmodel.new);

class BookmarkViewmodel extends Notifier<List<Station>> {
  late BookmarkRepository _bookmarkRepo;
  @override
  List<Station> build() {
    _bookmarkRepo = ref.watch(bookmarkProvider);
    final steam = _bookmarkRepo.onBookmarkChanged(
      (key) => state = [..._bookmarkRepo.getBookmarks()],
    );

    ref.onDispose(() {
      steam.cancel();
    });

    return [..._bookmarkRepo.getBookmarks()];
  }

  bool isBookmarked(Station station) {
    return ref.read(bookmarkProvider).isBookmarked(station);
  }

  bool toggleBookmark(Station station) {
    _bookmarkRepo.toggleBookmark(station);
    state = [..._bookmarkRepo.getBookmarks()];
    return isBookmarked(station);
  }
}
