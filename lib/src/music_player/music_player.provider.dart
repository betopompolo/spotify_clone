import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/common/utils/stopwatch_stream.dart';
import 'package:spotify_clone/src/home/mocks.dart';

final playerControlProvider =
    StateNotifierProvider<_PlayerControlNotifier, bool>(
  (ref) => _PlayerControlNotifier(),
);

final playlistProvider = StateProvider<List<Music>>((ref) => []);

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
    void _handlePlaylistChange(List<Music>? prev, List<Music> playlist) {
      state = 0;
      _stop();

      if (playlist.isNotEmpty) {
        play(playlist.first);
      }
    }

    void _handlePlayerControlChange(bool? prev, bool isPlaying) {
      if (isPlaying) {
        resume();
      } else {
        pause();
      }
    }

    final playlistListener = ref.listen<List<Music>>(
      playlistProvider,
      _handlePlaylistChange,
      fireImmediately: true,
    );

    final playerListener = ref.listen<bool>(
      playerControlProvider,
      _handlePlayerControlChange,
      fireImmediately: true,
    );

    ref.onDispose(() {
      playlistListener();
      playerListener();
    });
  }

  StreamSubscription<Duration>? stopwatchSub;

  play(Music music) {
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

final musicAlbumProvider =
    FutureProvider.family<Album, Music>((ref, music) async {
  await Future.delayed(const Duration(seconds: 1));

  final album = mockedAlbums.firstWhere(
    (albumMock) => albumMock.musics.any((it) => music.id == it.id),
  );

  return album;
});
