import 'package:json_annotation/json_annotation.dart';

part 'breedImage.g.dart';

@JsonSerializable()
class BreedImage {
  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'width')
  final String width;

  @JsonKey(name: 'height')
  final String height;

  BreedImage(this.url, this.id, this.width, this.height);

  factory BreedImage.fromJson(Map<String, dynamic> json) =>
      _$BreedImageFromJson(json);
}