// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) {
  return CouponModel(
    id: json['id'] as int?,
    memberships: (json['memberships'] as List<dynamic>?)
        ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    code: json['code'] as String?,
    quantity: json['quantity'] as int?,
    used: json['used'] as int?,
    reduction: json['reduction'] as int?,
    endAt:
        json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
  );
}

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberships': instance.memberships,
      'code': instance.code,
      'quantity': instance.quantity,
      'used': instance.used,
      'reduction': instance.reduction,
      'endAt': instance.endAt?.toIso8601String(),
    };
