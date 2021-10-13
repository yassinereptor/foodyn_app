
import 'package:equatable/equatable.dart';
import 'eatery_model.dart';
import 'table_model.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'section_model.g.dart';

@JsonSerializable()
class SectionModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "eatery")
  EateryModel? eatery;
  @JsonKey(name: "tables")
  List<TableModel>? tables;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "rows")
  int? rows;
  @JsonKey(name: "columns")
  int? columns;

  SectionModel({
    this.id,
    this.eatery,
    this.tables,
    this.title,
    this.rows,
    this.columns
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionModelToJson(this);

  @override
  String toString() {
    return """SectionModel(
    id: $id,
    eatery: $eatery,
    tables: $tables,
    title: $title,
    rows: $rows,
    columns: $columns
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        eatery,
        tables,
        title,
        rows,
        columns
      ];

}