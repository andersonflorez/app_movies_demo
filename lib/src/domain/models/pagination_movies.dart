import 'package:app_movies_demo_exito_2/src/domain/models/movie.dart';

class PaginationMovies {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<Movie> movies;

  PaginationMovies({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.movies,
  });

  factory PaginationMovies.fromJson(Map<String, dynamic> json) =>
      PaginationMovies(
        page: json['page'],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        movies: List<Movie>.from(
          (json['results'] as List<dynamic>).map(
            (movie) => Movie.fromJson(movie),
          ),
        ),
      );
}
