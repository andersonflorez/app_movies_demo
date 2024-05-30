import 'package:app_movies_demo_exito_2/global/api/api_client.dart';
import 'package:app_movies_demo_exito_2/global/custom_exception.dart';
import 'package:dio/dio.dart';

class MoviesApi {
  final ApiClient apiClient;

  MoviesApi(this.apiClient);

  Future<Map<String, dynamic>> getMoviesNowPlaying() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final response = await apiClient.get(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e, s) {
      throw CustomException(
        messageUser: 'Perdón, no pudimos mostrarte las películas en cine',
        internalErrorCode: '10E-${e.response!.statusCode}',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        httpErrorCode: e.response!.statusCode,
      );
    }
  }

  Future<Map<String, dynamic>> getMoviesPopular() async {
    try {
      await Future.delayed(Duration(seconds: 10));
      final response = await apiClient.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e, s) {
      throw CustomException(
        messageUser: 'Perdón, no pudimos mostrarte las películas en populares',
        internalErrorCode: '20E-${e.response!.statusCode}',
        internalErrorMessage: e.toString(),
        stackTrace: s,
        httpErrorCode: e.response!.statusCode,
      );
    }
  }
}
