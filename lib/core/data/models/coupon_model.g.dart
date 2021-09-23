// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) {
  return CouponModel(
    id: json['id'] as int?,
    code: json['code'] as String?,
    quantity: json['quantity'] as int?,
    used: json['used'] as int?,
    reduction: json['reduction'] as int?,
    endAt:
        json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
    active: json['active'] as bool?,
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

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'quantity': instance.quantity,
      'used': instance.used,
      'reduction': instance.reduction,
      'endAt': instance.endAt?.toIso8601String(),
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
