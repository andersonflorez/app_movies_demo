import 'package:app_movies_demo_exito_2/src/domain/models/casting_movie.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';

class GetCastingMovie {
  final MovieRepository movieRepository;

  GetCastingMovie(this.movieRepository);
  Future<List<CastingMovie>> call(String movieId) {
    return movieRepository.getCastingMovie(movieId);
  }
}
