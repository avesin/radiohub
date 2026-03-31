import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/colors.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/core/repository.dart';
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
    ref.listen<AsyncValue<LocationData>>(locationProvider, (prev, next) {
      next.when(
        data: (value) {
          print(
            "New location:  ${value.position.latitude}, ${value.position.longitude}, country: ${value.placemark.country}",
          );
          ref.read(dashboardProvider.notifier).setLocation(value);
        },
        loading: () => print("Fetching location..."),
        error: (error, stackTrace) => ref
            .read(dashboardProvider.notifier)
            .setLocationError("Error fetching location: $error"),
      );
    });
    final currentIndex = ref.watch(
      dashboardProvider.select((s) => s.currentIndex),
    );
    ref.watch(dashboardProvider.select((s) => s.selectedCountry));
    final station = ref.watch(stationProvider.select((s) => s.station));
    final player = ref.read(audioPlayerProvider);
    final playerState = ref.watch(audioStateProvider);

    return Scaffold(
      extendBody: true,
      backgroundColor: black,
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            child: ref.read(locationProvider).isLoading
                ? Center(child: CircularProgressIndicator())
                : Stack(children: [pages[currentIndex]]),
          ),
        ],
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
