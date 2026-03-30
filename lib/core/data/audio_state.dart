import 'package:just_audio/just_audio.dart';

class AudioPlayerState {
  final ProcessingState? processingState;
  final PlayerState? playerState;
  final UriAudioSource? audioSource;

  AudioPlayerState({
    required this.processingState,
    required this.playerState,
    required this.audioSource,
  });

  bool get isPlaying => playerState?.playing ?? false;
  bool get isBuffering =>
      processingState == ProcessingState.buffering ||
      processingState == ProcessingState.loading;
}
