// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationStateModel _$LocationStateModelFromJson(Map<String, dynamic> json) {
  return LocationStateModel(
    name: json['name'] as String?,
    cities:
        (json['cities'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$LocationStateModelToJson(LocationStateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cities': instance.cities,
    };
