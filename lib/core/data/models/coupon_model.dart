import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.g.dart';

@JsonSerializable()
class CouponModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "memberships")
  List<UserModel>? memberships;
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

  CouponModel({
    this.id,
    this.memberships,
    this.code,
    this.quantity,
    this.used,
    this.reduction,
    this.endAt
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponModelToJson(this);

  @override
  String toString() {
    return """CouponModel(
      id: $id,
      memberships: $memberships,
      code: $code,
      quantity: $quantity,
      used: $used,
      reduction: $reduction,
      endAt: $endAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        memberships,
        code,
        quantity,
        used,
        reduction,
        endAt
      ];

}

