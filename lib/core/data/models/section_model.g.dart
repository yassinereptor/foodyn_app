// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionModel _$SectionModelFromJson(Map<String, dynamic> json) {
  return SectionModel(
    id: json['id'] as int?,
    eatery: json['eatery'] == null
        ? null
        : EateryModel.fromJson(json['eatery'] as Map<String, dynamic>),
    tables: (json['tables'] as List<dynamic>?)
        ?.map((e) => TableModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
    rows: json['rows'] as int?,
    columns: json['columns'] as int?,
  );
}

Map<String, dynamic> _$SectionModelToJson(SectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eatery': instance.eatery,
      'tables': instance.tables,
      'title': instance.title,
      'rows': instance.rows,
      'columns': instance.columns,
    };
