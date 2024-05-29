import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final dio = Dio();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: getMoviesNowPlaying(dio),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  }
                  final movies = snapshot.data!['results'] as List<dynamic>;
                  return Column(
                    children: movies.map((e) => Text(e['title'])).toList(),
                  );
                },
              ),
              Divider(),
              FutureBuilder(
                future: getMoviesPopular(dio),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  }
                  final movies = snapshot.data!['results'] as List<dynamic>;
                  return Column(
                    children: movies.map((e) => Text(e['title'])).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getMoviesNowPlaying(Dio dio) async {

    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getMoviesPopular(Dio dio) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=a4f267f23954fdcaf26820877cdc213a&language=es-CO');
    return response.data as Map<String, dynamic>;
  }
}
