import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/global/custom_exception.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:app_movies_demo_exito_2/src/domain/usecases/get_movies_popular.dart';
import 'package:flutter/material.dart';

class MoviesPopularController extends ChangeNotifier {
  late PaginationMovies _paginationMovies;
  ControllerState _state = ControllerState.initial;
  late final GetMoviesPopular _getMoviesPopular;
  final MovieRepository _movieRepository;
  CustomException? error;

  MoviesPopularController(this._movieRepository) {
    _getMoviesPopular = GetMoviesPopular(_movieRepository);
  }

  ControllerState get state => _state;
  PaginationMovies get paginationMovies => _paginationMovies;

  Future<void> getMoviesPopular() async {
    try {
      _state = ControllerState.loading;
      notifyListeners();

      _paginationMovies = await _getMoviesPopular.call();

      _state = ControllerState.success;
      notifyListeners();
    } catch (e) {
      error = e as CustomException;
      _state = ControllerState.error;
      notifyListeners();
    }
  }
}
