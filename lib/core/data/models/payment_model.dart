import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "asset")
  String? asset;
  @JsonKey(name: "primaryColor")
  String? primaryColor;
  @JsonKey(name: "accentColor")
  String? accentColor;
  @JsonKey(name: "textColor")
  String? textColor;
  @JsonKey(name: "soon")
  bool? soon;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  DateTime? deletedAt;

  PaymentModel({
    this.id,
    this.type,
    this.title,
    this.description,
    this.asset,
    this.primaryColor,
    this.accentColor,
    this.textColor,
    this.soon,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  @override
  String toString() {
    return """PaymentModel(
    id: $id,
    type: $type,
    title: $title,
    description: $description,
    asset: $asset,
    primaryColor: $primaryColor,
    accentColor: $accentColor,
    textColor: $textColor,
    soon: $soon,
    active: $active,
    createdAt: $createdAt,
    updatedAt: $updatedAt,
    deletedAt: $deletedAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        type,
        title,
        description,
        asset,
        primaryColor,
        accentColor,
        textColor,
        soon,
        active,
        createdAt,
        updatedAt,
        deletedAt
      ];

}

