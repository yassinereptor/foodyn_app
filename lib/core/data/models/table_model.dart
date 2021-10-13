
import 'package:equatable/equatable.dart';
import 'eatery_model.dart';
import 'section_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'table_model.g.dart';

@JsonSerializable()
class TableModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "section")
  SectionModel? section;
  @JsonKey(name: "number")
  int? number;
  @JsonKey(name: "row")
  int? row;
  @JsonKey(name: "column")
  int? column;

  TableModel({
    this.id,
    this.section,
    this.number,
    this.row,
    this.column,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);

  Map<String, dynamic> toJson() => _$TableModelToJson(this);

  @override
  String toString() {
    return """TableModel(
    id: $id,
    section: $section,
    number: $number,
    row: $row,
    column: $column
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        section,
        number,
        row,
        column,
      ];

}