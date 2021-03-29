import 'package:json_annotation/json_annotation.dart';

import 'package:cat_breed_app/Utils/Network/Content/image.dart';

part 'breedResponse.g.dart';

@JsonSerializable()
class BreedResponse {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'temperament')
  final String? temperament;

  @JsonKey(name: 'image')
  final Image? image;

  BreedResponse(this.name, this.id, this.description, this.temperament, this.image);

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);
}
