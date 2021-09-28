import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends Equatable  {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "type")
  final int? type;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "asset")
  final String? asset;
  @JsonKey(name: "primaryColor")
  final String? primaryColor;
  @JsonKey(name: "accentColor")
  final String? accentColor;
  @JsonKey(name: "textColor")
  final String? textColor;
  @JsonKey(name: "soon")
  final bool? soon;

  PaymentModel({
    this.id,
    this.type,
    this.title,
    this.description,
    this.asset,
    this.primaryColor,
    this.accentColor,
    this.textColor,
    this.soon
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
    soon: $soon
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
        soon
      ];

}

