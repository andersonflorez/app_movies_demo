import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/image_movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_now_playing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesNowPlayingController>(
      builder: (context, moviesController, child) {
        if (moviesController.state == ControllerState.initial ||
            moviesController.state == ControllerState.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (moviesController.state == ControllerState.error) {
          return Column(
            children: [
              Text(moviesController.error!.internalErrorCode),
              Text(moviesController.error!.messageUser),
            ],
          );
        } else {
          final movies = moviesController.paginationMovies!.movies;
          return Swiper(
            itemBuilder: (context, index) {
              return ImageMovie(
                urlImage: movies[index].getUrlImage(),
              );
            },
            itemCount: movies.length,
            itemWidth: 255,
            layout: SwiperLayout.STACK,
          );
        }
      },
    );
  }
}
