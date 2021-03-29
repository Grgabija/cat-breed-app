import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageView extends StatefulWidget {
  String? breedImageUrl;

  ImageView(String? breedImageUrl) : this.breedImageUrl = breedImageUrl;

  @override
  _BreedImageState createState() => _BreedImageState(breedImageUrl);
}

class _BreedImageState extends State<ImageView> {
  String? breedImageUrl;

  _BreedImageState(String? breedImageUrl) : this.breedImageUrl = breedImageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: breedImageUrl!,
      child: Container(
        child: PhotoView.customChild(
          enableRotation: true,
          minScale: 1.0,
          maxScale: 3.0,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            fit: BoxFit.contain,
            image: breedImageUrl!,
          ),
        ),
      ),
    );
  }
}
