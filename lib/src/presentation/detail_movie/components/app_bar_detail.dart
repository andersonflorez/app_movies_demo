import 'package:app_movies_demo_exito_2/src/domain/models/movie.dart';
import 'package:flutter/material.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      backgroundColor: Colors.black,
      leading: InkWell(
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onTap: (){
          Navigator.of(context).pop();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          movie.title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        background: Image.network(movie.getUrlImageBackdrop),
      ),
    );
  }
}
