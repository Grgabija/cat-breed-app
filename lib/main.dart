import 'package:flutter/material.dart';

import 'package:cat_breed_app/BreedList/breedListHome.dart';
import 'package:cat_breed_app/Utils/Localization/strings.dart';

void main() =>
  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BreedListHome(),
    );
  }
}
