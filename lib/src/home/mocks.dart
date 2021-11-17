import 'package:spotify_clone/src/common/models.dart';

final List<Album> mockedAlbums = [
  Album(
    id: 'album1',
    title: 'Unplugged',
    musics: [
      Music(
        id: 'id',
        name: 'Layla',
        duration: const Duration(minutes: 4, seconds: 49),
      ),
      Music(
        id: 'id',
        name: 'Walkin\'g blues',
        duration: const Duration(minutes: 3, seconds: 36),
      ),
      Music(
        id: 'id',
        name: 'Hey hey',
        duration: const Duration(minutes: 3, seconds: 46),
      ),
    ],
    thumbnailUrl:
        'https://c-cl.cdn.smule.com/rs-s77/arr/0c/69/c0420e23-1d58-40dd-9f7f-d510e6b55cf2.jpg',
  ),
  Album(
    id: 'album2',
    title: 'Acústico MTV',
    musics: [
      Music(
        id: 'id',
        name: 'O papa é pop',
        duration: const Duration(
          minutes: 3,
          seconds: 35,
        ),
      ),
      Music(
        id: 'id',
        name: 'Armas químicas e poemas',
        duration: const Duration(
          minutes: 3,
          seconds: 31,
        ),
      ),
      Music(
        id: 'id',
        name: 'Infinita highway',
        duration: const Duration(
          minutes: 4,
          seconds: 18,
        ),
      ),
    ],
    thumbnailUrl:
        'https://www.vagalume.com.br/engenheiros-do-hawaii/discografia/acustico-mtv-engenheiros-do-hawaii.jpg',
  ),
  Album(
    id: 'album3',
    title: 'Waiting for the Sun',
    musics: [
      Music(
        id: 'id',
        name: 'Hello, I love you',
        duration: const Duration(
          minutes: 2,
          seconds: 13,
        ),
      ),
      Music(
        id: 'id',
        name: 'Love street',
        duration: const Duration(
          minutes: 2,
          seconds: 49,
        ),
      ),
      Music(
        id: 'id',
        name: 'Five to one',
        duration: const Duration(
          minutes: 4,
          seconds: 24,
        ),
      ),
    ],
    thumbnailUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81T5Hv8DfuL.jpg',
  ),
];

final mockedWrapped = [
  Wrapped(
    id: 'wrapped1',
    text:
        'The songs you loved most this year, all wrapped in a single playlist. Listen now!',
    coverUrl: 'https://lineup-images.scdn.co/wrapped-2020-top100_LARGE-en.jpg',
  ),
  Wrapped(
    id: 'wrapped2',
    text: 'Top songs from 2020 that we know you won\'t want to miss',
    coverUrl: 'https://lineup-images.scdn.co/wrapped-2020-top100_LARGE-en.jpg',
  ),
];
