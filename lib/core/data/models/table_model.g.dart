// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return TableModel(
    id: json['id'] as int?,
    section: json['section'] == null
        ? null
        : SectionModel.fromJson(json['section'] as Map<String, dynamic>),
    number: json['number'] as int?,
    row: json['row'] as int?,
    column: json['column'] as int?,
  );
}

Map<String, dynamic> _$TableModelToJson(TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section': instance.section,
      'number': instance.number,
      'row': instance.row,
      'column': instance.column,
    };
