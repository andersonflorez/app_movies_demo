import 'package:app_movies_demo_exito_2/global/api/api_client.dart';

class MoviesApi {
  final ApiClient apiClient;

  MoviesApi(this.apiClient);

  Future<Map<String, dynamic>> getMoviesNowPlaying() async {
    try {
    final response = await apiClient.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
    return response.data as Map<String, dynamic>;
      
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getMoviesPopular() async {
    final response = await apiClient.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
    return response.data as Map<String, dynamic>;
  }
}
