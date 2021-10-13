part of 'send_bloc.dart';

@freezed
class SendEvent with _$SendEvent {
  factory SendEvent.sendOtp(int dialCode, String phoneNumber) = _SendOtp;
  factory SendEvent.verifyOtp(String otp) = _VerifyOtp;
  factory SendEvent.confirmationEmailStatus() = _ConfirmationEmailStatus;
  factory SendEvent.resendConfirmationEmail(String email) = _ResendConfirmationEmail;
}