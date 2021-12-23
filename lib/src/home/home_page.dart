import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/home/mocks.dart';
import 'package:spotify_clone/src/home/wrapped_view.dart';
import 'package:spotify_clone/src/music_player/floating_music_player.dart';
import 'package:spotify_clone/src/music_player/music_player.provider.dart';

import 'home_background.dart';
import 'home_recently_player_sliver.dart';
import 'home_section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: Stack(
        children: [
          const HomeBackground(),
          _HomeContent(),
          Positioned(
            child: const FloatingMusicPlayer(),
            bottom: safeArea.bottom,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  _HomeContent({
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
            child: SizedBox(
              height: safeArea.top,
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeSectionHeader(
              title: 'Recently Played',
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return RecentlyPlayedGridSliver(
                albums: albums,
                onTap: (album) {
                  ref.read(playlistProvider.notifier).state = album.musics;
                },
              );
            },
          ),
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
