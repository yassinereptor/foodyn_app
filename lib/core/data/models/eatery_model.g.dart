// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eatery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EateryModel _$EateryModelFromJson(Map<String, dynamic> json) {
  return EateryModel(
    id: json['id'] as int?,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    sections: (json['sections'] as List<dynamic>?)
        ?.map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    eateryTypes: (json['eateryTypes'] as List<dynamic>?)
        ?.map((e) => EateryTypeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
    description: json['description'] as String?,
    adresse: json['adresse'] as String?,
    dialCode: json['dialCode'] as int?,
    phoneNumber: json['phoneNumber'] as String?,
    phoneNumberVerified: json['phoneNumberVerified'] as bool?,
    country: json['country'] as String?,
    city: json['city'] as String?,
    posLat: (json['posLat'] as num?)?.toDouble(),
    posLng: (json['posLng'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$EateryModelToJson(EateryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'sections': instance.sections,
      'images': instance.images,
      'eateryTypes': instance.eateryTypes,
      'title': instance.title,
      'description': instance.description,
      'adresse': instance.adresse,
      'dialCode': instance.dialCode,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberVerified': instance.phoneNumberVerified,
      'country': instance.country,
      'city': instance.city,
      'posLat': instance.posLat,
      'posLng': instance.posLng,
    };
