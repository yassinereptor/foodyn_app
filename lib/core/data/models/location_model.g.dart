// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return LocationModel(
    name: json['name'] as String?,
    states: (json['states'] as List<dynamic>?)
        ?.map((e) => LocationStateModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    dialCode: json['dialCode'] as int?,
    code: json['code'] as String?,
  );
}

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'states': instance.states,
      'dialCode': instance.dialCode,
      'code': instance.code,
    };
