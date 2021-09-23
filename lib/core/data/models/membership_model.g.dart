// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipModel _$MembershipModelFromJson(Map<String, dynamic> json) {
  return MembershipModel(
    id: json['id'] as int?,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    plan: json['plan'] == null
        ? null
        : PlanModel.fromJson(json['plan'] as Map<String, dynamic>),
    startAt: json['startAt'] == null
        ? null
        : DateTime.parse(json['startAt'] as String),
    endAt:
        json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
    active: json['active'] as bool?,
    banned: json['banned'] as bool?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    deletedAt: json['deletedAt'] == null
        ? null
        : DateTime.parse(json['deletedAt'] as String),
  );
}

Map<String, dynamic> _$MembershipModelToJson(MembershipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'plan': instance.plan,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'active': instance.active,
      'banned': instance.banned,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
