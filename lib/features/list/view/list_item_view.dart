import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:radioapp/core/colors.dart';
import 'package:radioapp/core/data/station.dart';
import 'package:radioapp/core/transparent_route.dart';
import 'package:radioapp/features/list/view_model/list_item_viewmodel.dart';
import 'package:radioapp/features/play/view/play_bottomsheet.dart';

class ListItemView extends ConsumerWidget {
  final Station station;
  final bool isFirst;
  final bool isLast;
  final Function(BuildContext) onTap;
  const ListItemView({
    super.key,
    required this.station,
    this.isFirst = false,
    this.isLast = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = listItemProvider(station);
    final state = ref.watch(provider);
    final notifier = ref.read(provider.notifier);

    return SizedBox(
      height: 100,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 1,
                    color: isFirst ? Colors.transparent : white,
                  ),
                ),
                Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: white,
                        blurRadius: 10,
                        blurStyle: BlurStyle.solid,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: state.isActive ? pink : white,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 1,
                    color: isLast ? Colors.transparent : white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onTap(context);
                Navigator.push(
                  context,
                  TransparentRoute(
                    child: PlayerBottomSheet(
                      station: station,
                    ), // No '() =>' here
                  ),
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Color(0xFF121212),
                  borderRadius: BorderRadius.circular(16),
                  border: state.isActive
                      ? Border.all(color: pink, width: 2)
                      : null,
                  boxShadow: state.isActive
                      ? [BoxShadow(color: pink.withAlpha(102), blurRadius: 12)]
                      : [],
                ),
                child: Row(
                  children: [
                    Hero(
                      tag: station.stationuuid,
                      child: Material(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            station.favicon,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              Typicons.infinity,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            station.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            station.country,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => notifier.toggleBookmark(station),
                          icon: Icon(
                            state.isBookmarked
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: state.isBookmarked ? pink : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
