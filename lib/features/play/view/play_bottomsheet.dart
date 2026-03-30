import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/colors.dart';
import 'package:radioapp/core/data/station.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/core/view/blink_dot.dart';
import 'package:radioapp/core/view_model/station_viewmodel.dart';
import 'package:radioapp/features/list/view_model/list_item_viewmodel.dart';
import 'package:lottie/lottie.dart';

class PlayerBottomSheet extends ConsumerWidget {
  final Station station;
  const PlayerBottomSheet({super.key, required this.station});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMute = ref.watch(stationProvider.select((s) => s.isMute));
    final volume = ref.watch(stationProvider.select((s) => s.nonMuteVolume));
    final player = ref.watch(audioPlayerProvider);
    final playerState = ref.watch(audioStateProvider);
    final volumeStream = ref.watch(systemVolumeProvider);
    final providerBookmark = listItemProvider(station);
    final stateBookmark = ref.watch(providerBookmark);
    final notifierBookmark = ref.read(providerBookmark.notifier);
    final blinkState = ref.watch(blinkProvider);

    blinkState.color = playerState.maybeWhen(
      orElse: () => Colors.transparent,
      data: (state) {
        if (state.isBuffering &&
            state.audioSource?.uri.toString() == station.urlResolved) {
          return Colors.yellow;
        } else if (state.isPlaying &&
            state.audioSource?.uri.toString() == station.urlResolved) {
          return pink;
        } else {
          return Colors.transparent;
        }
      },
    );

    volumeStream.whenData((v) {
      if (!isMute) {
        player.setVolume(v);
      }
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(color: Colors.transparent),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF1C1C1E), // Dark grey like iOS player
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Handle
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Hero(
                    tag: station.stationuuid,
                    child: Material(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          station.favicon,
                          height: 260,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    station.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    station.country,
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -150,
                          left: 16,
                          right: 16,
                          child:
                              playerState.whenData((state) {
                                if ((state.isPlaying) &&
                                    state.audioSource?.uri.toString() ==
                                        station.urlResolved) {
                                  return Lottie.asset(
                                    frameRate: FrameRate(120),
                                    'assets/lottie/wave.json',
                                    fit: BoxFit.cover,
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              }).value ??
                              const SizedBox.shrink(),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 8),
                                  BlinkDot(),
                                  SizedBox(width: 8),
                                  Text(
                                    playerState.maybeWhen(
                                      orElse: () => "",
                                      data: (state) {
                                        if (state.isBuffering &&
                                            state.audioSource?.uri.toString() ==
                                                station.urlResolved) {
                                          return "BUFFERING";
                                        } else if (state.isPlaying &&
                                            state.audioSource?.uri.toString() ==
                                                station.urlResolved) {
                                          return "LIVE";
                                        } else {
                                          return "";
                                        }
                                      },
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      var v = player.volume;
                                      player.setVolume(isMute ? volume : 0.0);
                                      ref
                                          .read(stationProvider.notifier)
                                          .setIsMute(!isMute, v);
                                    },
                                    icon: Icon(
                                      isMute
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      color: Colors.white,
                                    ),
                                  ),
                                  playerState.when(
                                    data: (state) {
                                      if ((state.isPlaying ||
                                              state.isBuffering) &&
                                          state.audioSource?.uri.toString() ==
                                              station.urlResolved) {
                                        return IconButton(
                                          onPressed: () => player.stop(),
                                          icon: Icon(
                                            Icons.pause,
                                            color: Colors.white,
                                            size: 60,
                                          ),
                                        );
                                      } else {
                                        return IconButton(
                                          onPressed: () {
                                            ref
                                                .read(stationProvider.notifier)
                                                .setPlayStation(station);
                                            player
                                                .setUrl(station.urlResolved)
                                                .then((_) => player.play());
                                          },
                                          icon: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 60,
                                          ),
                                        );
                                      }
                                    },
                                    loading: () =>
                                        const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                    error: (e, __) {
                                      return const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      );
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      notifierBookmark.toggleBookmark(station);
                                    },
                                    icon: stateBookmark.isBookmarked
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                          )
                                        : const Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
