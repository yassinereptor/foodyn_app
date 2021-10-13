
import 'package:equatable/equatable.dart';
import 'section_model.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'location_state_model.g.dart';

@JsonSerializable()
class LocationStateModel extends Equatable  {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "cities")
  List<String>? cities;

  LocationStateModel({
    this.name,
    this.cities,
  });

  factory LocationStateModel.fromJson(Map<String, dynamic> json) =>
      _$LocationStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationStateModelToJson(this);

  @override
  String toString() {
    return """LocationStateModel(
    name: $name,
    cities: $cities
    )""";
  }

  @override
  List<Object?> get props => [
        name,
        cities
      ];

}