import 'package:app_movies_demo_exito_2/src/domain/models/casting_movie.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';

abstract class MovieRepository {
  Future<PaginationMovies> getMoviesNowPlaying();
  Future<PaginationMovies> getMoviesPopular(int page);
  Future<List<CastingMovie>> getCastingMovie(String movieId);
}
