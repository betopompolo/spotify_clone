import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/home/album_card_small.dart';
import 'package:spotify_clone/src/home/mocks.dart';
import 'package:spotify_clone/src/home/wrapped_view.dart';
import 'package:spotify_clone/src/music_player/floating_music_player.dart';
import 'package:spotify_clone/src/music_player/music_player.provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

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
        HomeContent(),
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
  HomeContent({
    Key? key,
  }) : super(key: key);

  final List<Album> albums = mockedAlbums;

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).viewPadding;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: safeArea.top,
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeSectionHeader(
              title: 'Recently Played',
            ),
          ),
          AlbumGridView(albums: albums),
          SliverToBoxAdapter(
            child: HomeSectionHeader(
              title: 'A Look Back at 2020',
              subtitle: '#SPOTIFYWRAPPED',
              headerLeadingIcon: Image.network(
                'https://styles.redditmedia.com/t5_2qofj/styles/communityIcon_2y6i62hipc731.png?width=256&s=5eb3b919abd1e76c3380199d15d9d4a9a808d037',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: ListView.separated(
                itemBuilder: (_, index) {
                  final wrapped = mockedWrapped[index];
                  return WrappedView(wrapped: wrapped);
                },
                separatorBuilder: (_, _index) => const SizedBox(
                  width: 16.0,
                ),
                itemCount: mockedWrapped.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.headerLeadingIcon,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Widget? headerLeadingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 16.0),
      child: Row(
        children: [
          if (headerLeadingIcon != null)
            Container(
              height: 32,
              width: 32,
              margin: const EdgeInsets.only(right: 8.0),
              child: headerLeadingIcon,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.caption,
                ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold,
                      wordSpacing: -2.0,
                    ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
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
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          return AlbumCardSmall(
            album: albums[index],
            onTap: (album) {
              ref.read(playlistProvider.notifier).state = album.musics;
            },
          );
        },
        childCount: albums.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 1,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
