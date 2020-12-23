import 'package:json_annotation/json_annotation.dart';

import 'package:cat_breed_app/Utils/Network/Content/image.dart';

part 'breedsList.g.dart';

@JsonSerializable()
class BreedsList {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'temperament')
  final String temperament;

  @JsonKey(name: 'image')
  final List<Image> image;

  BreedsList(this.name, this.description, this.temperament, this.image);

  factory BreedsList.fromJson(Map<String, dynamic> json) =>
      _$BreedsListFromJson(json);
}
