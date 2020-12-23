import 'package:cat_breed_app/Utils/Network/Content/breedResponse.dart';

abstract class Breeds {
  Future<List<BreedResponse>> getBreedsList();
}
