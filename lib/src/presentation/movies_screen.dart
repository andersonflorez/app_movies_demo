import 'package:app_movies_demo_exito_2/src/presentation/components/now_playing_component.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/popular_component.dart';
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
        title: const Text('Películas en cine'),
        backgroundColor: Colors.blue,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: NowPlayingComponent(),
            ),
            SizedBox(height: 30),
            Text('Populares'),
            SizedBox(height: 10),
            Expanded(
              child: PopularComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
