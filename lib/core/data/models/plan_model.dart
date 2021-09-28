import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/data/models/coupon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.g.dart';

@JsonSerializable()
class PlanModel extends Equatable  {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "memberships")
  final List<CouponModel>? memberships;
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

  PlanModel({
    this.id,
    this.memberships,
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
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanModelToJson(this);

  @override
  String toString() {
    return """PlanModel(
    id: $id,
    memberships: $memberships,
    title: $title,
    description: $description,
    monthPrice: $monthPrice,
    yearPrice: $yearPrice,
    primaryColor: $primaryColor,
    accentColor: $accentColor,
    textColor: $textColor,
    recommended: $recommended,
    special: $special,
    endAt: $endAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        memberships,
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
      ];

}

