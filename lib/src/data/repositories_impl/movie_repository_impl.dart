import 'package:app_movies_demo_exito_2/global/api/api_client.dart';
import 'package:app_movies_demo_exito_2/global/custom_exception.dart';
import 'package:app_movies_demo_exito_2/src/data/datasources/api/movies_api.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/casting_movie.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:get_it/get_it.dart';

class MovieRepositoryImpl extends MovieRepository {
  late final MoviesApi moviesApi;
  MovieRepositoryImpl() {
    moviesApi = MoviesApi(GetIt.I<ApiClient>());
  }

  @override
  Future<PaginationMovies> getMoviesNowPlaying() async {
    final response = await moviesApi.getMoviesNowPlaying();
    try {
      return PaginationMovies.fromJson(response);
    } catch (e, s) {
      throw CustomException(
        messageUser: 'Perdón, no pudimos mostrarte las películas en cine',
        internalErrorCode: '10T123',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: response.toString(),
      );
    }
  }

  @override
  Future<PaginationMovies> getMoviesPopular(int page) async {
    final response = await moviesApi.getMoviesPopular(page);
    try {
      return PaginationMovies.fromJson(response);
    } catch (e, s) {
      throw CustomException(
        messageUser: 'Perdón, no pudimos mostrarte las películas en populares',
        internalErrorCode: '20T123',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: response.toString(),
      );
    }
  }

  @override
  Future<List<CastingMovie>> getCastingMovie(String movieId) async {
    final response = await moviesApi.getCastingMovie(movieId);
    try {
      return List<CastingMovie>.from(
        (response['cast'] as List<dynamic>).map(
          (cast) => CastingMovie.fromJson(cast),
        ),
      );
    } catch (e, s) {
      throw CustomException(
        messageUser: 'Perdón, no pudimos mostrarte las actores de la película',
        internalErrorCode: '20T123',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        data: response.toString(),
      );
    }
  }
}
