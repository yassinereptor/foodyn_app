import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/app_failure.dart';

part 'otp_bloc.freezed.dart';
part 'otp_event.dart';
part 'otp_state.dart';

@injectable
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final Logger _logger;

  OtpBloc(
    this._logger,
  ) : super(_Initial());

  @override
  Stream<OtpState> mapEventToState(
    OtpEvent gEvent,
  ) async* {
    yield* gEvent.when(
      sendOtp: (int dialCode, String phoneNumber) => _sendOtpHandler(dialCode, phoneNumber),
      verifyOtp: (String otp) => _verifyOtpHandler(otp)
    );
  }

  @override
  void onEvent(OtpEvent event) {
    _logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<OtpState> change) {
    _logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<OtpState> _sendOtpHandler(int dialCode, String phoneNumber) async* {
    AppFailure? appFailure;
    yield OtpState.loadingSending();

    
    
    
    
    
    
    
    
    
    
    
      yield OtpState.loadingSent();
  }

  Stream<OtpState> _verifyOtpHandler(String otp) async* {
    AppFailure? appFailure;
    yield OtpState.loadingInProgress();

    
    
    
    
    
    
    
    
    
    
    
      yield OtpState.loadingSuccess();
  }

}
