class Movie {
  final String id;
  final String title;
  final String imagePoster;
  final String? imageBackdrop;
  final String description;
  final double voteAverage;
  final String originalTitle;

  Movie({
    required this.id,
    required this.title,
    required this.imagePoster,
    required this.imageBackdrop,
    required this.description,
    required this.voteAverage,
    required this.originalTitle,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'].toString(),
        title: json['title'],
        imagePoster: json['poster_path'],
        imageBackdrop: json['backdrop_path'],
        description: json['overview'],
        voteAverage: json['vote_average'] as double,
        originalTitle: json['original_title'],
      );

  String getUrlImagePoster() {
    return 'https://image.tmdb.org/t/p/w500/$imagePoster';
  }

  String get getUrlImageBackdrop =>
      'https://image.tmdb.org/t/p/w500/$imageBackdrop';
}
