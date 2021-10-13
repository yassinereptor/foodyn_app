import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';
import 'membership_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "image")
  ImageModel? image;
  @JsonKey(name: "fullname")
  String? fullname;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "adresse")
  String? adresse;
  @JsonKey(name: "dialCode")
  int? dialCode;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "phoneNumberVerified")
  bool? phoneNumberVerified;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "posLat")
  double? posLat;
  @JsonKey(name: "posLng")
  double? posLng;
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
    this.image,
    this.fullname,
    this.username,
    this.adresse,
    this.dialCode,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.country,
    this.city,
    this.gender,
    this.posLat,
    this.posLng,
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
    image: $image,
    fullname: $fullname,
    username: $username,
    adresse: $adresse,
    dialCode: $dialCode,
    phoneNumber: $phoneNumber,
    phoneNumberVerified: $phoneNumberVerified,
    country: $country,
    city: $city,
    gender: $gender,
    posLat: $posLat,
    posLng: $posLng,
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
        image,
        fullname,
        username,
        adresse,
        dialCode,
        phoneNumber,
        phoneNumberVerified,
        country,
        city,
        gender,
        posLat,
        posLng,
        memberships,
        type,
        email,
        password,
        verified,
      ];

}

