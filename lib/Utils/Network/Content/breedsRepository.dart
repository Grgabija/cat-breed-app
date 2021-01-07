import 'package:cat_breed_app/Utils/Network/Content/breedResponse.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedImage.dart';

abstract class Breeds {
  Future<List<BreedResponse>> getBreedsList();

  Future<List<BreedImage>> getBreedImage();
}
