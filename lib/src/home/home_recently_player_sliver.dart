import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/common/models.dart';

class RecentlyPlayedGridSliver extends ConsumerWidget {
  const RecentlyPlayedGridSliver({
    Key? key,
    required this.albums,
    required this.onTap,
  }) : super(key: key);

  final List<Album> albums;
  final void Function(Album album) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          return _AlbumCardSmall(
            album: albums[index],
            onTap: onTap,
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

class _AlbumCardSmall extends StatelessWidget {
  final Album album;
  final void Function(Album album)? onTap;

  const _AlbumCardSmall({
    Key? key,
    required this.album,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(album);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          color: Colors.grey.shade900,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(album.thumbnailUrl),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
                child: Text(
              album.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
