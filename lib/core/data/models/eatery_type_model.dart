
import 'package:equatable/equatable.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'section_model.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'eatery_type_model.g.dart';

@JsonSerializable()
class EateryTypeModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "eateries")
  List<EateryModel>? eateries;
  @JsonKey(name: "title")
  String? title;

  EateryTypeModel({
    this.id,
    this.eateries,
    this.title,
  });

  factory EateryTypeModel.fromJson(Map<String, dynamic> json) =>
      _$EateryTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EateryTypeModelToJson(this);

  @override
  String toString() {
    return """EateryTypeModel(
    id: $id,
    eateries: $eateries,
    title: $title
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        eateries,
        title
      ];

}