import 'package:flutter/material.dart';

import 'package:cat_breed_app/Utils/Localization/strings.dart';
import 'package:cat_breed_app/Utils/Network/Content/theCatApi.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedsRepository.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedResponse.dart';
import 'package:cat_breed_app/Utils/Network/Exceptions/apiExceptionMapper.dart';

class BreedListHome extends StatefulWidget {
  @override
  _BreedListHomeState createState() => _BreedListHomeState();
}

class _BreedListHomeState extends State<BreedListHome> {
  final Breeds _breeds = TheCatApi();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(Strings.mainScreenTitle),
      ),
      body: _buildListView(),
    );

  Widget _buildListView() => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FutureBuilder<List<BreedResponse>>(
                  future: _breeds.getBreedsList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                          ApiExceptionMapper.toErrorMessage(snapshot.error));
                    } else {
                      final breeds = snapshot.data;
                      return ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: breeds.length,
                        itemBuilder: (context, i) {
                          final breed = breeds[i];
                          return _buildCardView(breed);
                        },
                      );
                    }
                  }),
            ),
          ]);

  Widget _buildCardView(BreedResponse breed) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                  left: 0, top: 8, right: 8, bottom: 8),
              child: Icon(Icons.account_circle, size: 96)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${breed.name}',
                    style: Theme.of(context).textTheme.headline5),
                Text(
                  '${breed.description}',
                ),
                 Text('Breed temperament:',
                     style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '${breed.temperament}',
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
