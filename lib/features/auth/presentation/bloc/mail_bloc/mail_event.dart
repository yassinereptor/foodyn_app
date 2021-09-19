part of 'mail_bloc.dart';

@freezed
class MailEvent with _$MailEvent {
  factory MailEvent.confirmationEmailStatus() = _ConfirmationEmailStatus;
  factory MailEvent.resendConfirmationEmail(String email) = _ResendConfirmationEmail;
}