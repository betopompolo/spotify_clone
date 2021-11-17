class Music {
  final String id;
  final String name;
  final Duration duration;

  Music({
    required this.id,
    required this.name,
    required this.duration,
  });
}

class Album {
  final String id;
  final String title;
  final String thumbnailUrl;
  final List<Music> musics;

  Album({
    required this.id,
    required this.title,
    required this.musics,
    required this.thumbnailUrl,
  });
}

class Wrapped {
  final String id;
  final String text;
  final String coverUrl;

  Wrapped({
    required this.id,
    required this.text,
    required this.coverUrl,
  });
}
