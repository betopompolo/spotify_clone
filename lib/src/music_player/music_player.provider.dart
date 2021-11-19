import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/common/utils/stopwatch_stream.dart';
import 'package:spotify_clone/src/home/mocks.dart';

final playerControlProvider =
    StateNotifierProvider<_PlayerControlNotifier, bool>(
  (ref) => _PlayerControlNotifier(),
);

final currentAlbumProvider = StateProvider<Album>((ref) => mockedAlbums[0]);

class _PlayerControlNotifier extends StateNotifier<bool> {
  _PlayerControlNotifier() : super(false);

  play() {
    state = true;
  }

  pause() {
    state = false;
  }
}

final musicProgressProvider =
    StateNotifierProvider.autoDispose<_MusicProgressNotifier, double>(
  (ref) => _MusicProgressNotifier(ref),
);

class _MusicProgressNotifier extends StateNotifier<double> {
  _MusicProgressNotifier(Ref ref) : super(0) {
    void _handleAlbumChange(Album? prev, Album next) {
      state = 0;
      _stop();
      play(next.musics.first);
    }

    void _handlePlayerControlChange(bool? prev, bool isPlaying) {
      if (isPlaying) {
        resume();
      } else {
        pause();
      }
    }

    final albumListener = ref.listen<Album>(
      currentAlbumProvider,
      _handleAlbumChange,
      fireImmediately: true,
    );

    final playerListener = ref.listen<bool>(
      playerControlProvider,
      _handlePlayerControlChange,
      fireImmediately: true,
    );

    ref.onDispose(() {
      albumListener();
      playerListener();
    });
  }

  Music? currentMusic;
  StreamSubscription<Duration>? stopwatchSub;

  play(Music music) {
    currentMusic = music;
    stopwatchSub = stopwatchStream().listen((ellapsed) {
      final newProgress =
          ellapsed.inMilliseconds / music.duration.inMilliseconds;
      if (newProgress >= 1) {
        _stop();
      } else {
        state = newProgress;
      }
    });
  }

  void pause() {
    stopwatchSub?.pause();
  }

  void resume() {
    stopwatchSub?.resume();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  void _stop() {
    stopwatchSub?.cancel();
  }
}
