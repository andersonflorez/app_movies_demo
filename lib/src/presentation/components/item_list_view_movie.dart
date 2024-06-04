import 'package:app_movies_demo_exito_2/src/presentation/components/image_movie.dart';
import 'package:flutter/material.dart';

class ItemListViewMovie extends StatelessWidget {
  const ItemListViewMovie({
    super.key,
    required this.urlImage,
    required this.text,
  });

  final String urlImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          ImageMovie(urlImage: urlImage),
          SizedBox(height: 5),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
