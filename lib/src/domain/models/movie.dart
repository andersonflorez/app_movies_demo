class Movie {
  final String title;
  final String image;

  Movie({required this.title, required this.image});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json['title'],
        image: json['poster_path'],
      );

  String getUrlImage() {
    return 'https://image.tmdb.org/t/p/w500/$image';
  }
}
