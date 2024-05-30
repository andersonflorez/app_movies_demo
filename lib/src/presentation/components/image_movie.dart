import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageMovie extends StatelessWidget {
  const ImageMovie({
    super.key,
    required this.urlImage,
  });

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: urlImage,
        placeholder: (context, url) =>
            Image.asset('assets/images/image_placeholder.jpg'),
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/image_placeholder.jpg'),
      ),
    );
  }
}
