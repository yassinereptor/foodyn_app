// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eatery_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EateryTypeModel _$EateryTypeModelFromJson(Map<String, dynamic> json) {
  return EateryTypeModel(
    id: json['id'] as int?,
    eateries: (json['eateries'] as List<dynamic>?)
        ?.map((e) => EateryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$EateryTypeModelToJson(EateryTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eateries': instance.eateries,
      'title': instance.title,
    };
