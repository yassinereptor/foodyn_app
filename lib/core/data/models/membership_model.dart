import 'package:equatable/equatable.dart';
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
  @JsonKey(name: "startAt")
  final DateTime? startAt;
  @JsonKey(name: "endAt")
  final DateTime? endAt;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "banned")
  final bool? banned;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  final DateTime? deletedAt;

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

