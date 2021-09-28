// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) {
  return RecordModel(
    id: json['id'] as int?,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    status: json['status'] as String?,
    country: json['country'] as String?,
    countryCode: json['countryCode'] as String?,
    region: json['region'] as String?,
    regionName: json['regionName'] as String?,
    city: json['city'] as String?,
    zip: json['zip'] as String?,
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
    timezone: json['timezone'] as String?,
    isp: json['isp'] as String?,
    org: json['org'] as String?,
    operator: json['as'] as String?,
    query: json['query'] as String?,
  );
}

Map<String, dynamic> _$RecordModelToJson(RecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'status': instance.status,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'region': instance.region,
      'regionName': instance.regionName,
      'city': instance.city,
      'zip': instance.zip,
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'isp': instance.isp,
      'org': instance.org,
      'as': instance.operator,
      'query': instance.query,
    };
