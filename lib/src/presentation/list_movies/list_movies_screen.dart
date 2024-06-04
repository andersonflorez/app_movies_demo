import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/presentation/list_movies/components/now_playing_component.dart';
import 'package:app_movies_demo_exito_2/src/presentation/list_movies/components/popular_component.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_now_playing_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_popular_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MoviesNowPlayingController>().getMoviesNowPlaying();
      context.read<MoviesPopularController>().getMoviesPopular();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextAppBar(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: NowPlayingComponent(),
            ),
            const SizedBox(height: 30),
            Text(
              'Populares',
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: PopularComponent(),
            ),
          ],
        ),
      ),
    );
  }
}

class TextAppBar extends StatefulWidget {
  const TextAppBar({
    super.key,
  });

  @override
  State<TextAppBar> createState() => _TextAppBarState();
}

class _TextAppBarState extends State<TextAppBar> {
  @override
  Widget build(BuildContext context) {
    final moviesNowPlayingController =
        context.watch<MoviesNowPlayingController>();
    final moviesPopularController = context.watch<MoviesPopularController>();
    if (moviesNowPlayingController.state == ControllerState.loading) {
      return const Text('Cargando en cine');
    } else if (moviesPopularController.state == ControllerState.loading) {
      return const Text('Cargando populares');
    } else {
      return const Text('Películas cargadas');
    }
  }
}
