import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';

class GetMoviesNowPlaying {
  final MovieRepository movieRepository;

  GetMoviesNowPlaying(this.movieRepository);
  Future<PaginationMovies> call() {
    return movieRepository.getMoviesNowPlaying();
  }
}
