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
    };
