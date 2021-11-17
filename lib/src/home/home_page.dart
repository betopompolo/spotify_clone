import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/home/album_card_small.dart';
import 'package:spotify_clone/src/music_player/floating_music_player.dart';
import 'package:spotify_clone/src/home/home_section.dart';
import 'package:spotify_clone/src/home/mocks.dart';
import 'package:spotify_clone/src/home/wrapped_view.dart';
import 'package:spotify_clone/src/music_player/music_player.provider.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  final List<Album> albums = mockedAlbums;

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).viewPadding;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 0.3],
            ),
          ),
        ),
        HomeContent(albums: albums),
        Positioned(
          child: const FloatingMusicPlayer(),
          bottom: safeArea.bottom,
          left: 0,
          right: 0,
        ),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
    required this.albums,
  }) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeSection(
          title: "Good morning",
          child: AlbumGridView(albums: albums),
        ),
        const SizedBox(
          height: 32.0,
        ),
        HomeSection(
          title: "A Look Back at 2020",
          subtitle: '#SPOTIFYWRAPPED',
          headerLeadingIcon: Image.network(
              'https://styles.redditmedia.com/t5_2qofj/styles/communityIcon_2y6i62hipc731.png?width=256&s=5eb3b919abd1e76c3380199d15d9d4a9a808d037'),
          child: ListView.separated(
            itemBuilder: (_, index) =>
                WrappedView(wrapped: mockedWrapped[index]),
            separatorBuilder: (_, _index) => const SizedBox(
              width: 24.0,
            ),
            itemCount: mockedWrapped.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class AlbumGridView extends ConsumerWidget {
  const AlbumGridView({
    Key? key,
    required this.albums,
  }) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: albums
          .map(
            (album) => AlbumCardSmall(
              album: album,
              onTap: (_) {
                ref.read(currentAlbumProvider.notifier).state = album;
              },
            ),
          )
          .toList(),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 3 / 1,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
