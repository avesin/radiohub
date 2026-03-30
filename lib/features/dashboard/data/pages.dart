import 'package:flutter/material.dart';
import 'package:radioapp/features/bookmark/view/bookmark_view.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:radioapp/features/list/view/list_page_view.dart';

final pages = [ListPageView(), Container(), BookmarkView()];
final bars = [
  BottomNavigationBarItem(
    icon: Icon(Typicons.menu_outline),
    label: "CATALOGUE",
  ),
  BottomNavigationBarItem(icon: Icon(null), label: ""),
  BottomNavigationBarItem(icon: Icon(Typicons.bookmark), label: "BOOKMARKS"),
];
