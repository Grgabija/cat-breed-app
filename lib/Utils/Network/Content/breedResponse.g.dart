// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breedResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedResponse _$BreedResponseFromJson(Map<String, dynamic> json) {
  return BreedResponse(
    json['name'] as String,
    json['id'] as String,
    json['description'] as String,
    json['temperament'] as String,
    json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BreedResponseToJson(BreedResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'temperament': instance.temperament,
      'image': instance.image,
    };
