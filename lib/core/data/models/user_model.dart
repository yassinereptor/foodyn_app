import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'membership_model.dart';
import 'profile_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "profile")
  ProfileModel? profile;
  @JsonKey(name: "memberships")
  List<MembershipModel>? memberships;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "verified")
  bool? verified;

  UserModel({
    this.id,
    this.profile,
    this.memberships,
    this.type,
    this.email,
    this.password,
    this.verified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return """UserModel(
    id: $id,
    profile: $profile,
    memberships: $memberships,
    type: $type,
    email: $email,
    password: $password,
    verified: $verified
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        profile,
        memberships,
        type,
        email,
        password,
        verified,
      ];

}

