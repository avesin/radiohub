import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioHandlerImpl() {
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    mediaItem.add(
      const MediaItem(id: "radio", title: "Radio App", album: "Live"),
    );
  }

  Stream<ProcessingState> get processingStateStream =>
      _player.processingStateStream;

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  Stream<SequenceState> get sequenceStateStream => _player.sequenceStateStream;

  double get volume => _player.volume;

  @override
  Future<void> play() async {
    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        processingState: AudioProcessingState.ready,
      ),
    );
    _player.play();
  }

  @override
  Future<void> pause() async {
    playbackState.add(playbackState.value.copyWith(playing: false));
    _player.pause();
  }

  @override
  Future<void> stop() async {
    _player.stop();
  }

  @override
  Future<void> seek(Duration position) async {
    _player.seek(position);
  }

  Future<void> setUrl(String url) async {
    await _player.setUrl(url);
  }

  Future<void> dispose() async {
    await _player.dispose();
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }
}
