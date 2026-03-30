import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:radioapp/core/colors.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/core/view/notch_clipper.dart';
import 'package:radioapp/core/view_model/location_viewmodel.dart';
import 'package:radioapp/core/view_model/station_viewmodel.dart';
import 'package:radioapp/features/dashboard/data/pages.dart';
import 'package:radioapp/features/dashboard/presentation/view/playbutton_view.dart';
import 'package:radioapp/features/dashboard/presentation/viewmodel/dashboard_view_model.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(
      dashboardProvider.select((s) => s.currentIndex),
    );
    final selectedCountryIndex = ref.watch(
      dashboardProvider.select((s) => s.selectedCountryIndex),
    );
    final countries = ref.watch(dashboardProvider.select((s) => s.countries));
    ref.listen(locationProvider, (prev, next) {
      next.whenData(
        (value) => ref
            .read(dashboardProvider.notifier)
            .setSelectedCountry(value.placemark.country),
      );
    });
    final station = ref.watch(stationProvider.select((s) => s.station));
    final player = ref.read(audioPlayerProvider);
    final playerState = ref.watch(audioStateProvider);

    return Scaffold(
      extendBody: true,
      backgroundColor: black,
      body: Stack(children: [pages[currentIndex]]),
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Typicons.th_list_outline),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          color: dark,
          child: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(countries[index]),
                selected: index == selectedCountryIndex,
                onTap: () => {
                  ref.read(dashboardProvider.notifier).selectCountry(index),
                  Scaffold.of(context).closeEndDrawer(),
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: PlaybuttonView(
        onPressed: () {
          if (station != null) {
            playerState.when(
              data: (state) {
                if (state.isPlaying) {
                  player.stop();
                } else {
                  ref.read(stationProvider.notifier).setPlayStation(station);
                  player.setUrl(station.url).then((_) => player.play());
                }
              },
              error: (_, _) => {},
              loading: () {},
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('No station selected')));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: [
          ClipPath(
            clipper: NotchClipper(),
            child: Container(height: 80, color: dark),
          ),
          BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              ref.read(dashboardProvider.notifier).changeTab(index);
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconSize: 26,
            selectedItemColor: pink,
            unselectedItemColor: gray,
            showUnselectedLabels: false,
            selectedFontSize: 6,
            unselectedFontSize: 6,
            type: BottomNavigationBarType.fixed,
            items: bars,
          ),
        ],
      ),
    );
  }
}
