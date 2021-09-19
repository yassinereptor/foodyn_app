import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/models/profile_model.dart';
import 'package:foodyn_rest/core/models/record_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "profile")
  ProfileModel? profile;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "verified")
  bool? verified;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  DateTime? deletedAt;

  UserModel({
    this.id,
    this.profile,
    this.type,
    this.email,
    this.password,
    this.verified,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return """UserModel(
    id: $id,
    profile: $profile,
    type: $type,
    email: $email,
    password: $password,
    verified: $verified,
    createdAt: $createdAt,
    updatedAt: $updatedAt,
    deletedAt: $deletedAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        profile,
        type,
        email,
        password,
        verified,
        createdAt,
        updatedAt,
        deletedAt
      ];

}

