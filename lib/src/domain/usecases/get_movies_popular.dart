import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';

class GetMoviesPopular {
    final MovieRepository movieRepository;

  GetMoviesPopular(this.movieRepository);
  Future<PaginationMovies> call() {
    return movieRepository.getMoviesPopular();
  }
}
