import 'package:flutter/material.dart';

import 'package:cat_breed_app/Utils/Localization/strings.dart';

class BreedListHome extends StatefulWidget {
  @override
  _BreedListHomeState createState() => _BreedListHomeState();
}

class _BreedListHomeState extends State<BreedListHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.mainScreenTitle),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
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
                          Text('Breed Name',
                              style: Theme.of(context).textTheme.headline5),
                          Text(
                            'Big ass description.',
                          ),
                          Text(
                            'Big ass description. Big ass description.Big ass description.Big ass description.Big ass description.Big ass description.Big ass description. Big ass description.Big ass description.Big ass description.Big ass description.Big ass description.Big ass description.Big ass description. Big ass description. Big ass description. Big ass description. Big ass description.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]);
}
