import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/models/profile_model.dart';
import 'package:foodyn_rest/core/models/record_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'plan_model.g.dart';

@JsonSerializable()
class PlanModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "monthPrice")
  int? monthPrice;
  @JsonKey(name: "yearPrice")
  int? yearPrice;
  @JsonKey(name: "currency")
  int? currency;
  @JsonKey(name: "primaryColor")
  String? primaryColor;
  @JsonKey(name: "accentColor")
  String? accentColor;
  @JsonKey(name: "textColor")
  String? textColor;
  @JsonKey(name: "recommended")
  bool? recommended;
  @JsonKey(name: "special")
  bool? special;
  @JsonKey(name: "endAt")
  DateTime? endAt;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  DateTime? deletedAt;

  PlanModel({
    this.id,
    this.title,
    this.description,
    this.monthPrice,
    this.yearPrice,
    this.currency,
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
    currency: $currency,
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
        currency,
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

