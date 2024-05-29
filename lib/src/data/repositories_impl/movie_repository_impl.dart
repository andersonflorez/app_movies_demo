import 'package:app_movies_demo_exito_2/src/data/datasources/api/movies_api.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final moviesApi = MoviesApi();

  @override
  Future<PaginationMovies> getMoviesNowPlaying() async {
    final response = await moviesApi.getMoviesNowPlaying();
    return PaginationMovies.fromJson(response);
  }

  @override
  Future<PaginationMovies> getMoviesPopular() async {
    final response = await moviesApi.getMoviesPopular();
    return PaginationMovies.fromJson(response);
  }
}
