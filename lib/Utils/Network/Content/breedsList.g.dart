// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breedsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedsList _$BreedsListFromJson(Map<String, dynamic> json) {
  return BreedsList(
    json['name'] as String,
    json['description'] as String,
    json['temperament'] as String,
    (json['image'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BreedsListToJson(BreedsList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'temperament': instance.temperament,
      'image': instance.image,
    };
