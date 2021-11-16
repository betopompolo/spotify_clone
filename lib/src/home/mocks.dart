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

final mockedWrapped = [
  Wrapped(
    id: 'wrapped1',
    text:
        'The songs you loved most this year, all wrapped in a single playlist. Listen now!',
    coverUrl: 'https://lineup-images.scdn.co/wrapped-2020-top100_LARGE-en.jpg',
  ),
  Wrapped(
    id: 'wrapped1',
    text: 'Top songs from 2020 that we know you won\'t want to miss',
    coverUrl: 'https://lineup-images.scdn.co/wrapped-2020-top100_LARGE-en.jpg',
  ),
];
