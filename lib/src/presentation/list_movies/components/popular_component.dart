import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/movie.dart';
import 'package:app_movies_demo_exito_2/src/domain/repositories/movie_repository.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/image_movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/item_list_view_movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/casting_movie_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_popular_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/detail_movie/detail_movie_screen.dart';
import 'package:app_movies_demo_exito_2/src/presentation/list_movies/components/list_popular_movies.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesPopularController>(
      builder: (context, moviesPopularController, child) {
        if (moviesPopularController.state == ControllerState.initial ||
            (moviesPopularController.state == ControllerState.loading &&
                moviesPopularController.paginationMovies == null)) {
          return Center(child: CircularProgressIndicator());
        } else if (moviesPopularController.state == ControllerState.error) {
          return Column(
            children: [
              Text(
                moviesPopularController.error!.messageUser,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  moviesPopularController.getMoviesPopular();
                },
                child: Text("Reintentar"),
              ),
            ],
          );
        } else {
          //return Image.asset('assets/images/image_placeholder.jpg');
          /*return ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min ,
                children: [
                  Image.asset('assets/images/image_placeholder.jpg'),
                  Text("af"),
                ],
              ),
              Image.asset('assets/images/image_placeholder.jpg'),
              Image.asset('assets/images/image_placeholder.jpg'),
              Image.asset('assets/images/image_placeholder.jpg'),
            ],
          );*/
          final movies = moviesPopularController.paginationMovies!.movies;
          return ListPopularMovies(
            movies: movies,
            loading: moviesPopularController.state == ControllerState.loading,
          );
        }
      },
    );
  }
}
