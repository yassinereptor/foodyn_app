import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.g.dart';

@JsonSerializable()
class PlanModel extends Equatable  {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "monthPrice")
  final String? monthPrice;
  @JsonKey(name: "yearPrice")
  final String? yearPrice;
  @JsonKey(name: "primaryColor")
  final String? primaryColor;
  @JsonKey(name: "accentColor")
  final String? accentColor;
  @JsonKey(name: "textColor")
  final String? textColor;
  @JsonKey(name: "recommended")
  final bool? recommended;
  @JsonKey(name: "special")
  final bool? special;
  @JsonKey(name: "endAt")
  final DateTime? endAt;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  final DateTime? deletedAt;

  PlanModel({
    this.id,
    this.title,
    this.description,
    this.monthPrice,
    this.yearPrice,
    this.primaryColor,
    this.accentColor,
    this.textColor,
    this.recommended,
    this.special,
    this.endAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanModelToJson(this);

  @override
  String toString() {
    return """PlanModel(
    id: $id,
    title: $title,
    description: $description,
    monthPrice: $monthPrice,
    yearPrice: $yearPrice,
    primaryColor: $primaryColor,
    accentColor: $accentColor,
    textColor: $textColor,
    recommended: $recommended,
    special: $special,
    endAt: $endAt,
    createdAt: $createdAt,
    updatedAt: $updatedAt,
    deletedAt: $deletedAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        monthPrice,
        yearPrice,
        primaryColor,
        accentColor,
        textColor,
        recommended,
        special,
        endAt,
        createdAt,
        updatedAt,
        deletedAt
      ];

}

