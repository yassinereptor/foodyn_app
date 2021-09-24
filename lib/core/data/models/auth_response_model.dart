import 'package:equatable/equatable.dart';
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel extends Equatable  {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModel? user;

  AuthResponseModel({
    this.success,
    this.token,
    this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);

  @override
  String toString() {
    return """AuthResponseModel(
      success: $success,
    token: $token,
    user: $user
    )""";
  }

  @override
  List<Object?> get props => [
    success,
        token,
        user
      ];

}
