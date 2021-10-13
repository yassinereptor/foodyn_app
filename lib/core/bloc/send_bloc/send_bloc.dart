import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../data/models/user_model.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/repositories/i_auth_repository.dart';

part 'send_bloc.freezed.dart';
part 'send_event.dart';
part 'send_state.dart';

@injectable
class SendBloc extends Bloc<SendEvent, SendState> {
  final IAuthRepository _authRepository;
  final Logger _logger;
  
  SendBloc(
    this._logger,
    this._authRepository,
  ) : super(_Initial());

  @override
  Stream<SendState> mapEventToState(
    SendEvent gEvent,
  ) async* {
    yield* gEvent.when(
      confirmationEmailStatus: () => _confirmationEmailStatusHandler(),
      resendConfirmationEmail: (email) => _resendConfirmationEmailHandler(email),
      sendOtp: (int dialCode, String phoneNumber) => _sendOtpHandler(dialCode, phoneNumber),
      verifyOtp: (String otp) => _verifyOtpHandler(otp)
    );
  }

  @override
  void onEvent(SendEvent event) {
    _logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<SendState> change) {
    _logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<SendState> _resendConfirmationEmailHandler(String email) async* {
    AppFailure? appFailure;
    yield SendState.loadingInProgress();

    (await _authRepository.resendConfirmationEmail(email)).fold((failure) {
      appFailure = failure;
    }, (value) {
    });
    if (appFailure != null)
      yield SendState.loadingFailed(appFailure!);
    else
      yield SendState.loadingSuccess(null);
  }

  Stream<SendState> _confirmationEmailStatusHandler() async* {
    AppFailure? appFailure;
    UserModel? user;

    yield SendState.loadingInProgress();
    (await _authRepository.getUser()).fold((failure) {
      appFailure = failure;
    }, (value) {
      user = value;
    });
    if (appFailure != null)
      yield SendState.loadingFailed(appFailure!);
    else
      yield SendState.loadingSuccess(user);
  }

  Stream<SendState> _sendOtpHandler(int dialCode, String phoneNumber) async* {
    AppFailure? appFailure;
    yield SendState.loadingInProgress();
  }

  Stream<SendState> _verifyOtpHandler(String otp) async* {
    AppFailure? appFailure;
    yield SendState.loadingInProgress();
  }
  
}
