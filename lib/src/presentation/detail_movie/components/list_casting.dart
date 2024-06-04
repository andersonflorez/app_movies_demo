import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/item_list_view_movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/casting_movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCasting extends StatelessWidget {
  const ListCasting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CastingMovieController>(
      builder: (context, castingMovieController, child) {
        if (castingMovieController.state == ControllerState.initial ||
            castingMovieController.state == ControllerState.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (castingMovieController.state == ControllerState.error) {
          return Column(
            children: [
              Text(
                castingMovieController.error!.messageUser,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  castingMovieController.getCastingMovie();
                },
                child: Text("Reintentar"),
              ),
            ],
          );
        } else {
          final casting = castingMovieController.castingMovie;
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final actor = casting![index];
              return ItemListViewMovie(
                text: actor.name,
                urlImage: actor.getUrlImage,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 15);
            },
            itemCount: casting!.length,
          );
        }
      },
    );
  }
}
