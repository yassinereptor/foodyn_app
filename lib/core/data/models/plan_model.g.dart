// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return PlanModel(
    id: json['id'] as int?,
    memberships: (json['memberships'] as List<dynamic>?)
        ?.map((e) => CouponModel.fromJson(e as Map<String, dynamic>))
        .toList(),
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
  );
}

Map<String, dynamic> _$PlanModelToJson(PlanModel instance) => <String, dynamic>{
      'id': instance.id,
      'memberships': instance.memberships,
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
    };
