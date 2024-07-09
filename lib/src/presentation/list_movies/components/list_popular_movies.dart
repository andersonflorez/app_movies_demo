import 'package:app_movies_demo_exito_2/global/controller_state.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/item_list_view_movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/movies_popular_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/detail_movie/detail_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPopularMovies extends StatefulWidget {
  ListPopularMovies({
    super.key,
    required this.movies,
    required this.loading,
  });

  final List<Movie> movies;
  final bool loading;

  @override
  State<ListPopularMovies> createState() => _ListPopularMoviesState();
}

class _ListPopularMoviesState extends State<ListPopularMovies> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final controller = context.read<MoviesPopularController>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        if (controller.state != ControllerState.loading) {
          controller.getMoviesPopular();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == widget.movies.length) {
          return Center(child: CircularProgressIndicator());
        } else {
          final movie = widget.movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  /*builder: (_) => ChangeNotifierProvider(
                  create: (context) =>
                      CastingMovieController(GetIt.I<MovieRepository>()),
                  child: DetailMovieScreen(
                    movie: movie,
                  ),
                ),*/
                  builder: (context) => DetailMovieScreen(
                    fromNavigation: 'popular',
                    movie: movie,
                  ),
                ),
              );
            },
            child: ItemListViewMovie(
              text: movie.title,
              urlImage: movie.getUrlImagePoster(),
            ),
          );
        }
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 15);
      },
      itemCount: widget.movies.length + (widget.loading ? 1 : 0),
    );
  }
}
