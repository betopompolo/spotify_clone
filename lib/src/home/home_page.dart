import 'package:flutter/material.dart';
import 'package:spotify_clone/src/common/models.dart';
import 'package:spotify_clone/src/home/album_card_small.dart';
import 'package:spotify_clone/src/home/home_section.dart';
import 'package:spotify_clone/src/home/mocks.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView(
            children: [
              HomeSection(
                title: "Good morning!",
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
        ),
      ),
    );
  }
}

class WrappedView extends StatelessWidget {
  final Wrapped wrapped;

  const WrappedView({
    Key? key,
    required this.wrapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              wrapped.coverUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            wrapped.text,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(fontSize: 14.0, height: 1.4),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
