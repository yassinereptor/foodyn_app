import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.g.dart';

@JsonSerializable()
class CouponModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "used")
  int? used;
  @JsonKey(name: "reduction")
  int? reduction;
  @JsonKey(name: "endAt")
  DateTime? endAt;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  DateTime? deletedAt;

  CouponModel({
    this.id,
    this.code,
    this.quantity,
    this.used,
    this.reduction,
    this.endAt,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);

  @override
  String toString() {
    return """CouponModel(
      id: $id,
      code: $code,
      quantity: $quantity,
      used: $used,
      reduction: $reduction,
      endAt: $endAt,
      active: $active,
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      deletedAt: $deletedAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        code,
        quantity,
        used,
        reduction,
        endAt,
        active,
        createdAt,
        updatedAt,
        deletedAt
      ];

}

