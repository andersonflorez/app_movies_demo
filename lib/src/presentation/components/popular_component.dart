import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/image_movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_popular_controller.dart';
import 'package:flutter/material.dart';
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
            moviesPopularController.state == ControllerState.loading) {
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
            children: [
              Image.asset('assets/images/image_placeholder.jpg'),
              Image.asset('assets/images/image_placeholder.jpg'),
              Image.asset('assets/images/image_placeholder.jpg'),
              Image.asset('assets/images/image_placeholder.jpg'),
            ],
          );*/
          final movies = moviesPopularController.paginationMovies.movies;
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return SizedBox(
                width: 100,
                child: Column(
                  children: [
                    ImageMovie(urlImage: movie.getUrlImage()),
                    SizedBox(height: 5),
                    Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 15);
            },
            itemCount: movies.length,
          );
        }
      },
    );
  }
}
