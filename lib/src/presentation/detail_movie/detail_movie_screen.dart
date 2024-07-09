import 'package:app_movies_demo_exito_2/src/domain/models/movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/controllers/casting_movie_controller.dart';
import 'package:app_movies_demo_exito_2/src/presentation/detail_movie/components/app_bar_detail.dart';
import 'package:app_movies_demo_exito_2/src/presentation/components/image_movie.dart';
import 'package:app_movies_demo_exito_2/src/presentation/detail_movie/components/list_casting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({super.key, required this.movie, required this.fromNavigation});

  final Movie movie;
  final String fromNavigation;

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<CastingMovieController>().movieId != widget.movie.id) {
        context.read<CastingMovieController>().movieId = widget.movie.id;
        context.read<CastingMovieController>().getCastingMovie();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarDetail(movie: widget.movie),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Hero(
                        tag:
                            '${widget.fromNavigation}-${widget.movie.getUrlImagePoster()}',
                        child: ImageMovie(
                          urlImage: widget.movie.getUrlImagePoster(),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.movie.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.movie.originalTitle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_border),
                              Text(widget.movie.voteAverage.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(widget.movie.description),
                SizedBox(height: 15),
                SizedBox(height: 200, child: ListCasting()),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
