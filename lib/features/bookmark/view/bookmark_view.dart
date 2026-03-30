import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/features/bookmark/viewmodel/bookmark_viewmodel.dart';
import 'package:radioapp/features/list/view/list_item_view.dart';

class BookmarkView extends ConsumerWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkViewmodelProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (_, i) {
          final station = bookmarks[i];
          return ListItemView(
            station: station,
            isFirst: i == 0,
            isLast: i == bookmarks.length - 1,
            onTap: (ctx) {},
          );
        },
      ),
    );
  }
}
