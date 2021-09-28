
import 'package:equatable/equatable.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "image")
  ImageModel? image;
  @JsonKey(name: "fullname")
  String? fullname;
  @JsonKey(name: "adresse")
  String? adresse;
  @JsonKey(name: "dialCode")
  int? dialCode;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "phoneNumberVerified")
  bool? phoneNumberVerified;
  @JsonKey(name: "country")
  int? country;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "zipCode")
  int? zipCode;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "posLat")
  double? posLat;
  @JsonKey(name: "posLng")
  double? posLng;

  ProfileModel({
    this.id,
    this.user,
    this.image,
    this.fullname,
    this.adresse,
    this.dialCode,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.country,
    this.city,
    this.zipCode,
    this.gender,
    this.posLat,
    this.posLng,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  String toString() {
    return """ProfileModel(
    id: $id,
    user: $user,
    image: $image,
    fullname: $fullname,
    adresse: $adresse,
    dialCode: $dialCode,
    phoneNumber: $phoneNumber,
    phoneNumberVerified: $phoneNumberVerified,
    country: $country,
    city: $city,
    zipCode: $zipCode,
    gender: $gender,
    posLat: $posLat,
    posLng: $posLng
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        user,
        image,
        fullname,
        adresse,
        dialCode,
        phoneNumber,
        phoneNumberVerified,
        country,
        city,
        zipCode,
        gender,
        posLat,
        posLng,
      ];

}