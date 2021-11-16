import 'package:flutter/material.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/home/album_card_small.dart';
import 'package:spotify_clone/src/home/home_section.dart';
import 'package:spotify_clone/src/home/mocks.dart';
import 'package:spotify_clone/src/home/wrapped_view.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  final List<Album> albums = mockedAlbums;

  @override
  Widget build(BuildContext context) {
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
    return SafeArea(
      child: ListView(
        children: [
          HomeSection(
            title: "Good morning",
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children:
                  albums.map((album) => AlbumCardSmall(album: album)).toList(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 1,
              physics: const NeverScrollableScrollPhysics(),
            ),
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
      ),
    );
  }
}
