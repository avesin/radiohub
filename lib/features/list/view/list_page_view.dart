import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/colors.dart';
import 'package:radioapp/core/view_model/station_viewmodel.dart';
import 'package:radioapp/features/dashboard/presentation/viewmodel/dashboard_view_model.dart';
import 'package:radioapp/features/list/view/list_item_view.dart';
import 'package:radioapp/features/list/view_model/list_page_viewmodel.dart';

class ListPageView extends ConsumerWidget {
  const ListPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioAsync = ref.watch(listPageProvider);
    final countries = ref.watch(dashboardProvider.select((s) => s.countries));
    final selectedContryIndex = ref.watch(
      dashboardProvider.select((s) => s.selectedCountryIndex),
    );

    return Column(
      children: [
        SizedBox(
          height: 32,
          child: ListView.builder(
            itemCount: countries.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _tag(
                countries[index],
                index == selectedContryIndex,
                onTap: () {
                  ref.read(dashboardProvider.notifier).selectCountry(index);
                },
              );
            },
          ),
        ),
        Expanded(
          child: radioAsync.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text("Error: $e")),
            data: (radioState) {
              return ListView.builder(
                itemCount: radioState.stations.length,
                itemBuilder: (_, i) {
                  final station = radioState.stations[i];
                  return ListItemView(
                    key: ValueKey(station.stationuuid),
                    station: station,
                    isFirst: i == 0,
                    isLast: i == radioState.stations.length - 1,
                    onTap: (ctx) {
                      ref
                          .read(stationProvider.notifier)
                          .selectStation(i, station);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _tag(String text, bool isSelected, {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(right: 4, left: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 16, // ← important
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isSelected ? primary : dark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: isSelected ? dark : white)),
    ),
  );
}
