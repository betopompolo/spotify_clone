import 'package:flutter/material.dart';
import 'package:spotify_clone/src/common/models.dart';

final mockedTracks = List.generate(
  5,
  (index) => Track(
    id: index.toString(),
    name: 'Música $index',
    duration: "03:0$index",
  ),
);

final mockedAlbums = List.generate(
  5,
  (index) => Album(
    id: index.toString(),
    title: 'Album $index',
    tracks: mockedTracks,
    thumbnailUrl:
        'https://www.vagalume.com.br/engenheiros-do-hawaii/discografia/acustico-mtv-engenheiros-do-hawaii.jpg',
  ),
);

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  final List<Album> albums = mockedAlbums;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeSection(
              title: 'Good morning',
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: albums
                    .map((album) => AlbumCardSmall(album: album))
                    .toList(),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 1,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumCardSmall extends StatelessWidget {
  final Album album;

  const AlbumCardSmall({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(album.thumbnailUrl),
          const SizedBox(
            width: 2.0,
          ),
          Expanded(child: Text(album.title)),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  final String title;
  final Widget child;

  const HomeSection({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
