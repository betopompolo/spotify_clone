import 'package:flutter/material.dart';
import 'package:spotify_clone/src/common/models.dart';

class AlbumCardSmall extends StatelessWidget {
  final Album album;

  const AlbumCardSmall({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.grey.shade900,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(album.thumbnailUrl),
          const SizedBox(
            width: 5.0,
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
    );
  }
}
