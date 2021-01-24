import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:cat_breed_app/Utils/Network/Content/theCatApi.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedsRepository.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedImage.dart';
import 'package:cat_breed_app/Utils/Network/Exceptions/apiExceptionMapper.dart';

class BreedGallery extends StatefulWidget {
  String breedId;
  String name;

  BreedGallery(String breedId, String name) : this.breedId = breedId, this.name = name;

  @override
  _BreedGalleryState createState() => _BreedGalleryState(breedId, name);
}

class _BreedGalleryState extends State<BreedGallery> {
  String breedId;
  String name;

  _BreedGalleryState(String breedId, String name) : this.breedId = breedId, this.name = name;

  final Breeds _breeds = TheCatApi();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: _buildGalleryView(context),
      );

  Widget _buildGalleryView(BuildContext context) => Scaffold(
        body: Container(
          margin: EdgeInsets.all(12),
          child: FutureBuilder<List<BreedImage>>(
              future: _breeds.getBreedImage(breedId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    width: 50,
                    height: 50,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    ApiExceptionMapper.toErrorMessage(snapshot.error),
                  );
                } else {
                  final breedImage = snapshot.data;
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      itemCount: breedImage.length,
                      itemBuilder: (context, i) {
                        final breedImages = breedImage[i];
                        return _buildImageView(breedImages);
                      },
                      staggeredTileBuilder: (i) {
                        return new StaggeredTile.count(1, i.isEven ? 1.2 : 1.8);
                      });
                }
              }),
        ),
      );

  Widget _buildImageView(BreedImage breedImages) => Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            fit: BoxFit.cover,
            image: breedImages != null ? '${breedImages.url}' : null,
            imageErrorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Text('No image found 😢');
            },
          ),
        ),
      );
}
