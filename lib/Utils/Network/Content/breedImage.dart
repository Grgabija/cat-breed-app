import 'package:json_annotation/json_annotation.dart';

part 'breedImage.g.dart';

@JsonSerializable()
class BreedImage {
  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'width')
  final int width;

  @JsonKey(name: 'height')
  final int height;

  BreedImage(this.url, this.id, this.width, this.height);

  factory BreedImage.fromJson(Map<String, dynamic> json) =>
      _$BreedImageFromJson(json);
}