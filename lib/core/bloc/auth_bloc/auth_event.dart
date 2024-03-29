part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  factory AuthEvent.started() = _Started;
  factory AuthEvent.login(String email, String password) = _Login;
  factory AuthEvent.register(String email, String password) = _Register;
  factory AuthEvent.forgetPassword(String email) = _ForgetPassword;
  factory AuthEvent.jwtIsExpired() = _JwtIsExpired;
  factory AuthEvent.logout() = _Logout;
  factory AuthEvent.uploadImage(ImageType type, File file) = _UploadImage;
  factory AuthEvent.updateUser(UserModel user) = _UpdateUser;
  factory AuthEvent.saveMembership(int planId, int periodId, int? couponId) = _SaveMembership;
  factory AuthEvent.checkCouponStatus(String code) = _CheckCouponStatus;
}
