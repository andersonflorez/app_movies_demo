import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:app_movies_demo_exito_2/src/domain/usecases/get_movies_now_playing.dart';
import 'package:flutter/material.dart';

class MoviesNowPlayingController extends ChangeNotifier {
  late PaginationMovies _paginationMovies;
  ControllerState _state = ControllerState.initial;
  final MovieRepository _movieRepository;
  late final GetMoviesNowPlaying _getMoviesNowPlaying;

  MoviesNowPlayingController(this._movieRepository){
    _getMoviesNowPlaying = GetMoviesNowPlaying(_movieRepository);
  }

  ControllerState get state => _state;
  PaginationMovies? get paginationMovies => _paginationMovies;

  Future<void> getMoviesNowPlaying() async {
    _state = ControllerState.loading;
    notifyListeners();

    _paginationMovies = await _getMoviesNowPlaying.call();

    _state = ControllerState.success;
    notifyListeners();
  }
}
