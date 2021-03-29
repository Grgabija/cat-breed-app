import 'dart:io';

import 'package:cat_breed_app/Utils/Network/HTTPClient/httpClient.dart';
import 'package:cat_breed_app/Utils/Network/Exceptions/apiException.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedsRepository.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedResponse.dart';
import 'package:cat_breed_app/Utils/Network/Content/breedImage.dart';

class _Urls {
  static const baseUrl = "https://api.thecatapi.com/v1/";
  static const breedsList = "${baseUrl}breeds";
  static const breedImages = "${baseUrl}images/search?";
}
class _Headers {
  static const requestHeaders = {'x-api-key':'da562d8e-6e71-43a0-b3e8-e8d9066fc097',};
}

class TheCatApi extends Breeds {
  final HttpClient _httpClient = HttpClient();

  @override
  Future<List<BreedResponse>> getBreedsList() async {
    final List<dynamic> breedsListJson =
        await _httpClient.getRequest(_Urls.breedsList, _Headers.requestHeaders);
    if (breedsListJson.isEmpty) {
      throw EmptyResultException();
    }
    return breedsListJson
        .map((breedsJson) => BreedResponse.fromJson(breedsJson))
        .toList();
  }
  @override
  Future<List<BreedImage>> getBreedImage(String? breedId) async {
    final List<dynamic> breedImageJson =
    await _httpClient.getRequest(_Urls.breedImages + "breed_id=${breedId}" + "&" + "limit=100", _Headers.requestHeaders);
    if (breedImageJson.isEmpty) {
      throw EmptyResultException();
    }
    return breedImageJson
        .map((breedImageJson) => BreedImage.fromJson(breedImageJson))
        .toList();
  }
}
