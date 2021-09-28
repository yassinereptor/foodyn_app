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
    coupon: json['coupon'] == null
        ? null
        : CouponModel.fromJson(json['coupon'] as Map<String, dynamic>),
    startAt: json['startAt'] == null
        ? null
        : DateTime.parse(json['startAt'] as String),
    endAt:
        json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
  );
}

Map<String, dynamic> _$MembershipModelToJson(MembershipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'plan': instance.plan,
      'coupon': instance.coupon,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
    };
