import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:cat_breed_app/Utils/Localization/strings.dart';

class BreedGallery extends StatefulWidget {
  @override
  _BreedGalleryState createState() => _BreedGalleryState();
}

class _BreedGalleryState extends State<BreedGallery> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(Strings.mainScreenTitle),
        ),
        body: _buildGalleryView(context),
      );

  List<String> imageList = [
    'https://cdn2.thecatapi.com/images/SCHe-SekW.jpg',
    'https://cdn2.thecatapi.com/images/8NdgktL3E.jpg',
    'https://cdn2.thecatapi.com/images/MuEGe1-Sz.jpg',
    'https://cdn2.thecatapi.com/images/JFPROfGtQ.jpg',
    'https://cdn2.thecatapi.com/images/SCHe-SekW.jpg',
    'https://cdn2.thecatapi.com/images/8NdgktL3E.jpg',
    'https://cdn2.thecatapi.com/images/MuEGe1-Sz.jpg',
    'https://cdn2.thecatapi.com/images/JFPROfGtQ.jpg'
  ];

  Widget _buildGalleryView(BuildContext context) =>
      Scaffold(
        body: Container(
          margin: EdgeInsets.all(12),
          child: new StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageList[index],
                      fit: BoxFit.cover,),
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              }),
        ),
      );
}