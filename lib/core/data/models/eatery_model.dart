
import 'package:equatable/equatable.dart';
import 'package:foodyn_rest/core/data/models/eatery_type_model.dart';
import 'section_model.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'eatery_model.g.dart';

@JsonSerializable()
class EateryModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "sections")
  List<SectionModel>? sections;
  @JsonKey(name: "images")
  List<ImageModel>? images;
  @JsonKey(name: "eateryTypes")
  List<EateryTypeModel>? eateryTypes;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
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
  @JsonKey(name: "posLat")
  double? posLat;
  @JsonKey(name: "posLng")
  double? posLng;

  EateryModel({
    this.id,
    this.user,
    this.images,
    this.sections,
    this.eateryTypes,
    this.title,
    this.description,
    this.adresse,
    this.dialCode,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.country,
    this.city,
    this.posLat,
    this.posLng,
  });

  factory EateryModel.fromJson(Map<String, dynamic> json) =>
      _$EateryModelFromJson(json);

  Map<String, dynamic> toJson() => _$EateryModelToJson(this);

  @override
  String toString() {
    return """EateryModel(
    id: $id,
    user: $user,
    images: $images,
    sections: $sections,
    eateryTypes: $eateryTypes,
    title: $title,
    description: $description,
    adresse: $adresse,
    dialCode: $dialCode,
    phoneNumber: $phoneNumber,
    phoneNumberVerified: $phoneNumberVerified,
    country: $country,
    city: $city,
    posLat: $posLat,
    posLng: $posLng
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        user,
        images,
        sections,
        eateryTypes,
        title,
        description,
        adresse,
        dialCode,
        phoneNumber,
        phoneNumberVerified,
        country,
        city,
        posLat,
        posLng,
      ];

}