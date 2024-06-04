class CastingMovie {
  final String name;
  final String? image;

  CastingMovie({required this.name, required this.image});

  factory CastingMovie.fromJson(Map<String, dynamic> json) => CastingMovie(
        name: json['name'],
        image: json['profile_path'],
      );

  String get getUrlImage {
    return 'https://image.tmdb.org/t/p/w500/$image';
  }
}
