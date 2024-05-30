import 'package:app_movies_demo_exito_2/global/api/api_client.dart';
import 'package:app_movies_demo_exito_2/src/data/datasources/api/movies_api.dart';
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
    return PaginationMovies.fromJson(response);
  }

  @override
  Future<PaginationMovies> getMoviesPopular() async {
    final response = await moviesApi.getMoviesPopular();
    return PaginationMovies.fromJson(response);
  }
}
