import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';

abstract class MovieRepository {
  Future<PaginationMovies> getMoviesNowPlaying();
  Future<PaginationMovies> getMoviesPopular();
}
