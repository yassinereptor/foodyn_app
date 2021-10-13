
import 'package:equatable/equatable.dart';
import 'location_state_model.dart';
import 'section_model.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Equatable  {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "states")
  List<LocationStateModel>? states;
  @JsonKey(name: "dialCode")
  int? dialCode;
  @JsonKey(name: "code")
  String? code;

  LocationModel({
    this.name,
    this.states,
    this.dialCode,
    this.code,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  String toString() {
    return """LocationModel(
    name: $name,
    states: $states,
    dialCode: $dialCode,
    code: $code
    )""";
  }

  @override
  List<Object?> get props => [
        name,
        states,
        dialCode,
        code,
      ];

}

