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
