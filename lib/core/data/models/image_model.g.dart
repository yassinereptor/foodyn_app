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
    filename: json['filename'] as String?,
    filepath: json['filepath'] as String?,
    hash: json['hash'] as String?,
  );
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'type': instance.type,
      'filename': instance.filename,
      'filepath': instance.filepath,
      'hash': instance.hash,
    };
