// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int?,
    profile: json['profile'] == null
        ? null
        : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
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
      'profile': instance.profile,
      'memberships': instance.memberships,
      'email': instance.email,
      'password': instance.password,
      'verified': instance.verified,
    };
