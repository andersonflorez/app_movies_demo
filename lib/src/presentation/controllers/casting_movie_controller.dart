import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/global/custom_exception.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/casting_movie.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:app_movies_demo_exito_2/src/domain/usecases/get_casting_movie.dart';
import 'package:flutter/material.dart';

class CastingMovieController extends ChangeNotifier {
  late List<CastingMovie> _castingMovie;
  String movieId = '';
  ControllerState _state = ControllerState.initial;
  final MovieRepository _movieRepository;
  late final GetCastingMovie _getCastingMovie;
  CustomException? error;

  CastingMovieController(this._movieRepository) {
    _getCastingMovie = GetCastingMovie(_movieRepository);
  }

  ControllerState get state => _state;
  List<CastingMovie>? get castingMovie => _castingMovie;

  Future<void> getCastingMovie() async {
    try {
      _state = ControllerState.loading;
      notifyListeners();

      _castingMovie = await _getCastingMovie.call(movieId);

      _state = ControllerState.success;
      notifyListeners();
    } on CustomException catch (e) {
      print(e.messageUser);
      error = e;
      _state = ControllerState.error;
      notifyListeners();
    }
  }
}
