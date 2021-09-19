part of 'otp_bloc.dart';

@freezed
class OtpEvent with _$OtpEvent {
  const factory OtpEvent.sendOtp(int dialCode, String phoneNumber) = _SendOtp;
  const factory OtpEvent.verifyOtp(String otp) = _VerifyOtp;
}