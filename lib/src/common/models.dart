class Track {
  final String id;
  final String name;
  final String duration;

  Track({
    required this.id,
    required this.name,
    required this.duration,
  });
}

class Album {
  final String id;
  final String title;
  final String thumbnailUrl;
  final List<Track> tracks;

  Album({
    required this.id,
    required this.title,
    required this.tracks,
    required this.thumbnailUrl,
  });
}
