import 'package:cat_breed_app/Utils/Network/Content/breedsList.dart';

abstract class Breeds {
  Future<List<BreedsList>> getBreedsList();
}
