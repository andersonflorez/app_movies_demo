
import 'package:app_movies_demo_exito_2/src/data/repositories_impl/movie_repository_impl.dart';
import 'package:flutter/material.dart';

class MoviesPageCopy extends StatelessWidget {
  const MoviesPageCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: MovieRepositoryImpl().getMoviesNowPlaying(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }
                  final movies = snapshot.data!.movies;
                  return Column(
                    children: movies.map((e) => Text(e.title)).toList(),
                  );
                },
              ),
              const Divider(),
              FutureBuilder(
                future: MovieRepositoryImpl().getMoviesPopular(1),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }
                  final movies = snapshot.data!.movies;
                  return Column(
                    children: movies.map((e) => Text(e.title)).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
