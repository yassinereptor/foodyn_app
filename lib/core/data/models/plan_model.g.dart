// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return PlanModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    monthPrice: json['monthPrice'] as String?,
    yearPrice: json['yearPrice'] as String?,
    primaryColor: json['primaryColor'] as String?,
    accentColor: json['accentColor'] as String?,
    textColor: json['textColor'] as String?,
    recommended: json['recommended'] as bool?,
    special: json['special'] as bool?,
    endAt:
        json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
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

Map<String, dynamic> _$PlanModelToJson(PlanModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'monthPrice': instance.monthPrice,
      'yearPrice': instance.yearPrice,
      'primaryColor': instance.primaryColor,
      'accentColor': instance.accentColor,
      'textColor': instance.textColor,
      'recommended': instance.recommended,
      'special': instance.special,
      'endAt': instance.endAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
