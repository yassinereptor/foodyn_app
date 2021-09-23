// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return PaymentModel(
    id: json['id'] as int?,
    type: json['type'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    asset: json['asset'] as String?,
    primaryColor: json['primaryColor'] as String?,
    accentColor: json['accentColor'] as String?,
    textColor: json['textColor'] as String?,
    soon: json['soon'] as bool?,
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

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'asset': instance.asset,
      'primaryColor': instance.primaryColor,
      'accentColor': instance.accentColor,
      'textColor': instance.textColor,
      'soon': instance.soon,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
