// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int?,
    image: json['image'] == null
        ? null
        : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    fullname: json['fullname'] as String?,
    username: json['username'] as String?,
    adresse: json['adresse'] as String?,
    dialCode: json['dialCode'] as int?,
    phoneNumber: json['phoneNumber'] as String?,
    phoneNumberVerified: json['phoneNumberVerified'] as bool?,
    country: json['country'] as String?,
    city: json['city'] as String?,
    gender: json['gender'] as int?,
    posLat: (json['posLat'] as num?)?.toDouble(),
    posLng: (json['posLng'] as num?)?.toDouble(),
    memberships: (json['memberships'] as List<dynamic>?)
        ?.map((e) => MembershipModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    type: json['type'] as int?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    verified: json['verified'] as bool?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'image': instance.image,
      'fullname': instance.fullname,
      'username': instance.username,
      'adresse': instance.adresse,
      'dialCode': instance.dialCode,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberVerified': instance.phoneNumberVerified,
      'country': instance.country,
      'city': instance.city,
      'gender': instance.gender,
      'posLat': instance.posLat,
      'posLng': instance.posLng,
      'memberships': instance.memberships,
      'email': instance.email,
      'password': instance.password,
      'verified': instance.verified,
    };
