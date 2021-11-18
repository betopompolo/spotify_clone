import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/home/mocks.dart';

final playerControlProvider =
    StateNotifierProvider<_PlayerControlNotifier, bool>(
        (ref) => _PlayerControlNotifier());

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
    final albumListener =
        ref.listen<Album>(currentAlbumProvider, (previous, next) {
      _stop();
      play(next.musics.first);
    }, fireImmediately: true);

    final playerListener =
        ref.listen<bool>(playerControlProvider, (previous, isPlaying) {
      if (isPlaying) {
        resume();
      } else {
        pause();
      }
    }, fireImmediately: true);

    ref.onDispose(() {
      albumListener();
      playerListener();
    });
  }

  Timer? timer;
  final stopwatch = Stopwatch();
  Music? currentMusic;

  play(Music music) {
    currentMusic = music;
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (stopwatch.isRunning) {
        final newProgress =
            stopwatch.elapsedMilliseconds / music.duration.inMilliseconds;
        if (newProgress >= 1) {
          _stop();
        } else {
          state = newProgress;
        }
      }
    });
    stopwatch.start();
  }

  void pause() {
    stopwatch.stop();
    timer?.cancel();
  }

  void resume() {
    if (currentMusic != null) {
      play(currentMusic!);
      stopwatch.start();
    }
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  void _stop() {
    stopwatch.reset();
    timer?.cancel();
  }
}
