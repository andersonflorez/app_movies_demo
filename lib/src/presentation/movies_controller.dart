import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/data/repositories_impl/movie_repository_impl.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/usecases/get_movies_now_playing.dart';
import 'package:flutter/material.dart';

class MoviesController extends ChangeNotifier {
  late PaginationMovies _paginationMovies;
  ControllerState _state = ControllerState.initial;

  ControllerState get state => _state;
  PaginationMovies? get paginationMovies => _paginationMovies;

  final GetMoviesNowPlaying _getMoviesNowPlaying =
      GetMoviesNowPlaying(MovieRepositoryImpl());

  Future<void> getMoviesNowPlaying() async {
    _state = ControllerState.loading;
    notifyListeners();

    _paginationMovies = await _getMoviesNowPlaying.call();

    _state = ControllerState.success;
    notifyListeners();
  }
}
