// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    id: json['id'] as int?,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    image: json['image'] == null
        ? null
        : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    fullname: json['fullname'] as String?,
    adresse: json['adresse'] as String?,
    dialCode: json['dialCode'] as int?,
    phoneNumber: json['phoneNumber'] as String?,
    phoneNumberVerified: json['phoneNumberVerified'] as bool?,
    country: json['country'] as int?,
    city: json['city'] as String?,
    zipCode: json['zipCode'] as int?,
    gender: json['gender'] as int?,
    posLat: (json['posLat'] as num?)?.toDouble(),
    posLng: (json['posLng'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'image': instance.image,
      'fullname': instance.fullname,
      'adresse': instance.adresse,
      'dialCode': instance.dialCode,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberVerified': instance.phoneNumberVerified,
      'country': instance.country,
      'city': instance.city,
      'zipCode': instance.zipCode,
      'gender': instance.gender,
      'posLat': instance.posLat,
      'posLng': instance.posLng,
    };
