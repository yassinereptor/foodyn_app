import 'package:foodyn_rest/core/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

@freezed
abstract class AuthStatus with _$AuthStatus {
  const factory AuthStatus.initial() = _Initial;
  const factory AuthStatus.unauthenticated() = _Unauthenticated;
  const factory AuthStatus.authenticated() = _Authenticated;
  const factory AuthStatus.firstTime() = _FirstTime;
}
