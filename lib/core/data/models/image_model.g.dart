// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return ImageModel(
    id: json['id'] as int?,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    type: json['type'] as int?,
    profile: json['profile'] == null
        ? null
        : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
    filename: json['filename'] as String?,
    filepath: json['filepath'] as String?,
  );
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'type': instance.type,
      'profile': instance.profile,
      'filename': instance.filename,
      'filepath': instance.filepath,
    };
