import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership_model.g.dart';

@JsonSerializable()
class MembershipModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "plan")
  PlanModel? plan;
  @JsonKey(name: "startAt")
  DateTime? startAt;
  @JsonKey(name: "endAt")
  DateTime? endAt;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "banned")
  bool? banned;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  DateTime? deletedAt;

  MembershipModel({
    this.id,
    this.user,
    this.plan,
    this.startAt,
    this.endAt,
    this.active,
    this.banned,
    this.createdAt,
    this.updatedAt,
    this.deletedAt
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
    startAt: $startAt,
    endAt: $endAt,
    active: $active,
    banned: $banned,
    createdAt: $createdAt,
    updatedAt: $updatedAt,
    deletedAt: $deletedAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        user,
        plan,
        startAt,
        endAt,
        active,
        banned,
        createdAt,
        updatedAt,
        deletedAt
      ];

}

