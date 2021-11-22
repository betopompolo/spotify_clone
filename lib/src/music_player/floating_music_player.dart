import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/music_player/music_player.provider.dart';

class FloatingMusicPlayer extends ConsumerWidget {
  const FloatingMusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAlbum = ref.watch(currentAlbumProvider);
    final currentMusic = currentAlbum.musics.first;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.black,
      ),
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
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
                        currentMusic.name,
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
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 2.0,
              child: MusicProgressIndicator(currentMusic),
            )
          ],
        ),
      ),
    );
  }
}

class MusicProgressIndicator extends ConsumerWidget {
  const MusicProgressIndicator(
    this.music, {
    Key? key,
  }) : super(key: key);

  final Music music;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicProgress = ref.watch(musicProgressProvider);

    return LinearProgressIndicator(
      value: musicProgress,
      valueColor: const AlwaysStoppedAnimation(Colors.white),
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
      child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
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
