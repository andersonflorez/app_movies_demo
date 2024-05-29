import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/presentation/movies_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesController>(
      builder: (context, moviesController, child) {
        if (moviesController.state == ControllerState.initial ||
            moviesController.state == ControllerState.loading) {
          return CircularProgressIndicator();
        } else if (moviesController.state == ControllerState.error) {
          return Text("error");
        } else {
          final movies = moviesController.paginationMovies!.movies;
          return Swiper(
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: movies[index].getUrlImage(),
                placeholder: (context, url) => Image.asset('assets/images/image_placeholder.png'),
                errorWidget: (context, url, error) => Image.asset('assets/images/image_error.png'),
              );
            },
            itemCount: movies.length,
            itemWidth: 300.0,
            layout: SwiperLayout.STACK,
          );
        }
      },
    );
  }
}
