import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/data/models/coupon_model.dart';
import 'plan_model.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership_model.g.dart';

@JsonSerializable()
class MembershipModel extends Equatable  {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "user")
  final UserModel? user;
  @JsonKey(name: "plan")
  final PlanModel? plan;
  @JsonKey(name: "coupon")
  final CouponModel? coupon;
  @JsonKey(name: "startAt")
  final DateTime? startAt;
  @JsonKey(name: "endAt")
  final DateTime? endAt;

  MembershipModel({
    this.id,
    this.user,
    this.plan,
    this.coupon,
    this.startAt,
    this.endAt
  });

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      _$MembershipModelFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipModelToJson(this);

  @override
  String toString() {
    return """MembershipModel(
    id: $id,
    user: $user,
    plan: $plan,
    coupon: $coupon,
    startAt: $startAt,
    endAt: $endAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        user,
        plan,
        coupon,
        startAt,
        endAt
      ];

}

