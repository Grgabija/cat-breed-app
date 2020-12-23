import 'package:cat_breed_app/Utils/Network/HTTPClient/httpClient.dart';
import 'package:cat_breed_app/Utils/Network/Exceptions/apiException.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedsRepository.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedsList.dart';

class _Urls {
  static const baseUrl = "https://api.thecatapi.com/v1/";
  static const breedsList =
      "${baseUrl}breeds?api_key=da562d8e-6e71-43a0-b3e8-e8d9066fc097";
}

class TheCatApi extends Breeds {
  final HttpClient _httpClient = HttpClient();

  @override
  Future<List<BreedsList>> getBreedsList() async {
    final List<dynamic> breedsListJson =
        await _httpClient.getRequest(_Urls.breedsList);
    if (breedsListJson.isEmpty) {
      throw EmptyResultException();
    }
    return breedsListJson
        .map((breedsJson) => BreedsList.fromJson(breedsJson))
        .toList();
  }
}
