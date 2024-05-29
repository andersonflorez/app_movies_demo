import 'package:dio/dio.dart';

class MoviesApi {
  final dio = Dio();

  Future<Map<String, dynamic>> getMoviesNowPlaying() async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getMoviesPopular() async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
    return response.data as Map<String, dynamic>;
  }
}
