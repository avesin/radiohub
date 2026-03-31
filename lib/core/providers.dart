import 'dart:async';

import 'package:dio/dio.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:radioapp/core/data/audio_state.dart';
import 'package:radioapp/core/data/blink_state.dart';
import 'package:radioapp/core/repository.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radioapp/core/view_model/audio_player_handler.dart';
import 'package:volume_controller/volume_controller.dart';

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://de1.api.radio-browser.info",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        filter: (options, args) {
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }
  return dio;
});

final radioRepositoryProvider = Provider<RadioRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return RadioRepository(dio);
});

final audioPlayerProvider = Provider<AudioPlayerHandler>((ref) {
  final player = AudioPlayerHandler();

  ref.onDispose(() async {
    await player.dispose();
  });

  return player;
});

final _audioProcessingStateProvider = StreamProvider<ProcessingState>((ref) {
  final player = ref.watch(audioPlayerProvider);

  return player.processingStateStream.map((state) {
    return state;
  });
});

final _audioPlayerStateProvider = StreamProvider<PlayerState>((ref) {
  final player = ref.watch(audioPlayerProvider);
  return player.playerStateStream.map((state) {
    return state;
  });
});

final _playerAudioSourceProvider = StreamProvider<UriAudioSource?>((ref) {
  final player = ref.watch(audioPlayerProvider);
  final source = player.sequenceStateStream.map((s) {
    return s.currentSource as UriAudioSource?;
  });
  return source;
});

final audioStateProvider = Provider<AsyncValue<AudioPlayerState>>((ref) {
  final processing = ref.watch(_audioProcessingStateProvider);
  final playerState = ref.watch(_audioPlayerStateProvider);
  final source = ref.watch(_playerAudioSourceProvider);

  if (processing is AsyncData &&
      playerState is AsyncData &&
      source is AsyncData) {
    print(
      "AudioState updated tag: ${source.value?.headers.toString() ?? 'null'}}",
    );
    print("AudioState updated url: ${source.value?.uri ?? 'null'}}");
    return AsyncData(
      AudioPlayerState(
        processingState: processing.value,
        playerState: playerState.value,
        audioSource: source.value,
      ),
    );
  }

  if (processing is AsyncError) {
    return AsyncError(processing.error!, StackTrace.current);
  }
  if (playerState is AsyncError) {
    return AsyncError(playerState.error!, StackTrace.current);
  }
  if (source is AsyncError) {
    return AsyncError(source.error!, StackTrace.current);
  }

  return const AsyncLoading();
});

final encryptedPrefsProvider = Provider<EncryptedSharedPreferences>((ref) {
  final prefs = EncryptedSharedPreferences.getInstance();
  return prefs;
});

final systemVolumeProvider = StreamProvider<double>((ref) async* {
  final controller = VolumeController.instance;

  // initial volume
  yield await controller.getVolume();

  final stream = StreamController<double>();

  controller.addListener((volume) {
    stream.add(volume);
  });

  ref.onDispose(() {
    controller.removeListener();
    stream.close();
  });

  yield* stream.stream;
});

final bookmarkProvider = Provider<BookmarkRepository>((ref) {
  final prefs = ref.watch(encryptedPrefsProvider);
  return BookmarkRepository(prefs: prefs);
});

final blinkProvider = StateProvider<BlinkState>((ref) => BlinkState());
final blinkTimerProvider = Provider<void>((ref) {
  Future.doWhile(() async {
    await Future.delayed(const Duration(milliseconds: 700));
    final state = ref.read(blinkProvider.notifier).state;
    ref.read(blinkProvider.notifier).state = state.visible
        ? BlinkState(visible: false, color: state.color)
        : BlinkState(visible: true, color: state.color);
    return true;
  });
});
