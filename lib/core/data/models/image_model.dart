import 'package:equatable/equatable.dart';
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
  @JsonKey(name: "filename")
  String? filename;
  @JsonKey(name: "filepath")
  String? filepath;
  @JsonKey(name: "hash")
  String? hash;

  ImageModel({
    this.id,
    this.user,
    this.type,
    this.filename,
    this.filepath,
    this.hash,
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
    filename: $filename,
    filepath: $filepath
    hash: $hash
    )""";
  }

  @override
  List<Object?> get props => [
        id,
        user,
        type,
        filename,
        filepath,
        hash
      ];

}

