import 'package:equatable/equatable.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.g.dart';

@JsonSerializable()
class RecordModel extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "user")
  final UserModel? user;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "countryCode")
  final String? countryCode;
  @JsonKey(name: "region")
  final String? region;
  @JsonKey(name: "regionName")
  final String? regionName;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "zip")
  final String? zip;
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lon")
  final double? lon;
  @JsonKey(name: "timezone")
  final String? timezone;
  @JsonKey(name: "isp")
  final String? isp;
  @JsonKey(name: "org")
  final String? org;
  @JsonKey(name: "as")
  final String? operator;
  @JsonKey(name: "query")
  final String? query;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  final DateTime? deletedAt;

  RecordModel(
  {
    this.id,
    this.user,
    this.status,
    this.country,
    this.countryCode,
    this.region,
    this.regionName,
    this.city,
    this.zip,
    this.lat,
    this.lon,
    this.timezone,
    this.isp,
    this.org,
    this.operator,
    this.query,
    this.createdAt,
    this.updatedAt,
    this.deletedAt
  });

  factory RecordModel.fromJson(Map<String, dynamic> json) =>
      _$RecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecordModelToJson(this);

  @override
  String toString() {
    return """RecordModel(
    id: $id,
    user: $user,
    status: $status,
    country: $country,
    countryCode: $countryCode,
    region: $region,
    regionName: $regionName,
    city: $city,
    zip: $zip,
    lat: $lat,
    lon: $lon,
    timezone: $timezone,
    isp: $isp,
    org: $org,
    operator: $operator,
    query: $query,
    createdAt: $createdAt,
    updatedAt: $updatedAt,
    deletedAt: $deletedAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        user,
        status,
        country,
        countryCode,
        region,
        regionName,
        city,
        zip,
        lat,
        lon,
        timezone,
        isp,
        org,
        operator,
        query,
        createdAt,
        updatedAt,
        deletedAt
      ];
}
