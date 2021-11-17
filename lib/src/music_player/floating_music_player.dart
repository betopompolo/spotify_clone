import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/music_player/music_player.provider.dart';

// TODO: refactor without Stack
class FloatingMusicPlayer extends ConsumerWidget {
  const FloatingMusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAlbum = ref.watch(currentAlbumProvider);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.black,
      ),
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        currentAlbum.thumbnailUrl,
                        height: 32,
                        width: 32,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentAlbum.musics[0].name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            currentAlbum.title,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    const PlayPauseButton(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              height: 2.0,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const LinearProgressIndicator(
                value: 0.5,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
            bottom: 0,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}

class PlayPauseButton extends ConsumerWidget {
  const PlayPauseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(playerControlProvider);
    final playerControl = ref.read(playerControlProvider.notifier);

    return GestureDetector(
      child: Icon(isPlaying ? Icons.play_arrow : Icons.pause),
      onTap: () {
        if (isPlaying) {
          playerControl.pause();
        } else {
          playerControl.play();
        }
      },
    );
  }
}
