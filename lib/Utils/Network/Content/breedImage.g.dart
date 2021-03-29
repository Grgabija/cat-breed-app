// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breedImage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedImage _$BreedImageFromJson(Map<String, dynamic> json) {
  return BreedImage(
    json['url'] as String?,
    json['id'] as String?,
    json['width'] as int?,
    json['height'] as int?,
  );
}

Map<String, dynamic> _$BreedImageToJson(BreedImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
    };
