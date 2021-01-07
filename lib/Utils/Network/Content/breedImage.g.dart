// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breedImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedImage _$BreedImageFromJson(Map<String, dynamic> json) {
  return BreedImage(
    json['url'] as String,
    json['id'] as String,
    json['width'] as String,
    json['height'] as String,
  );
}

Map<String, dynamic> _$BreedImageToJson(BreedImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
    };
