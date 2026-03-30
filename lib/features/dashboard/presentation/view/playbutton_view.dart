import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/colors.dart';
import 'package:radioapp/core/providers.dart';
import 'package:radioapp/core/view_model/station_viewmodel.dart';
import 'package:radioapp/features/bookmark/viewmodel/bookmark_viewmodel.dart';

class PlaybuttonView extends ConsumerWidget {
  final VoidCallback onPressed;
  const PlaybuttonView({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final station = ref.watch(stationProvider.select((s) => s.station));
    final playerState = ref.watch(audioStateProvider);

    return GestureDetector(
      onTap: () {
        if (station == null) return;
        onPressed();
      },
      child: Container(
        width: 120,
        height: 120,
        child: Stack(
          children: [
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: station == null ? gray : pink,
                  shape: BoxShape.circle,
                  boxShadow: [
                    station != null
                        ? BoxShadow(color: softPink, blurRadius: 10)
                        : BoxShadow(color: Colors.transparent),
                  ],
                ),
                child: playerState.when(
                  data: (state) {
                    if (state.isBuffering) {
                      return CircularProgressIndicator(color: white);
                    } else if (state.isPlaying) {
                      return Icon(Icons.pause, color: white, size: 32);
                    } else {
                      return Icon(Icons.play_arrow, color: white, size: 32);
                    }
                  },
                  error: (error, stack) =>
                      Icon(Icons.error, color: Colors.red, size: 32),
                  loading: () => CircularProgressIndicator(color: white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
