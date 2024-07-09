import 'package:app_movies_demo_exito_2/config/app_theme.dart';
import 'package:app_movies_demo_exito_2/global/api/api_client.dart';
import 'package:app_movies_demo_exito_2/src/data/datasources/api/movies_api.dart';
import 'package:app_movies_demo_exito_2/src/data/repositories_impl/movie_repository_impl.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/casting_movie_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_now_playing_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_popular_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/list_movies/list_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<MoviesApi>(MoviesApi(ApiClient()));
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              MoviesNowPlayingController(getIt<MovieRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              MoviesPopularController(getIt<MovieRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CastingMovieController(getIt<MovieRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        debugShowCheckedModeBanner: false,
        home: const MoviesScreen(),
      ),
    );
  }
}
