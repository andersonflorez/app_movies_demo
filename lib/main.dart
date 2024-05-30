import 'package:app_movies_demo_exito_2/global/api/api_client.dart';
import 'package:app_movies_demo_exito_2/src/data/repositories_impl/movie_repository_impl.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_now_playing_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_popular_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<ApiClient>(ApiClient());
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MoviesScreen(),
      ),
    );
  }
}
