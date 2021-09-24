import 'package:equatable/equatable.dart';
import 'profile_model.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends Equatable  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  UserModel? user;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "profile")
  ProfileModel? profile;
  @JsonKey(name: "filename")
  String? filename;
  @JsonKey(name: "filepath")
  String? filepath;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "deletedAt")
  DateTime? deletedAt;

  ImageModel({
    this.id,
    this.user,
    this.type,
    this.profile,
    this.filename,
    this.filepath,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @override
  String toString() {
    return """ImageModel(
    id: $id,
    user: $user,
    type: $type,
    profile: $profile,
    filename: $filename,
    filepath: $filepath,
    createdAt: $createdAt,
    updatedAt: $updatedAt,
    deletedAt: $deletedAt
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        user,
        type,
        profile,
        filename,
        filepath,
        createdAt,
        updatedAt,
        deletedAt
      ];

}

