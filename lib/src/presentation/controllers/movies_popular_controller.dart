import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/global/custom_exception.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/movie.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:app_movies_demo_exito_2/src/domain/usecases/get_movies_popular.dart';
import 'package:flutter/material.dart';

class MoviesPopularController extends ChangeNotifier {
  PaginationMovies? _paginationMovies;
  ControllerState _state = ControllerState.initial;
  late final GetMoviesPopular _getMoviesPopular;
  final MovieRepository _movieRepository;
  CustomException? error;
  int page = 1;

  MoviesPopularController(this._movieRepository) {
    _getMoviesPopular = GetMoviesPopular(_movieRepository);
  }

  ControllerState get state => _state;
  PaginationMovies? get paginationMovies => _paginationMovies;

  Future<void> getMoviesPopular() async {
    try {
      _state = ControllerState.loading;
      notifyListeners();

      if (_paginationMovies == null) {
        _paginationMovies = await _getMoviesPopular.call(page);
      } else {
        final paginationMoviesNew = await _getMoviesPopular.call(page);
        _paginationMovies!.movies.addAll(paginationMoviesNew.movies);
      }
      page++;
      _state = ControllerState.success;
      notifyListeners();
    } catch (e) {
      error = e as CustomException;
      _state = ControllerState.error;
      notifyListeners();
    }
  }
}
