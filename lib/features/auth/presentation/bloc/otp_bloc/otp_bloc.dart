import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodyn_rest/core/services/graphql_service.dart';
import 'package:foodyn_rest/features/auth/data/datasources/authentication_local_data_source.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/domain/repositories/i_authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'otp_event.dart';
part 'otp_state.dart';
part 'otp_bloc.freezed.dart';

@injectable
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final IAuthenticationRepository authenticationRepository;
  final IAuthenticationLocalDataSource authenticationLocalDataSource;
  final Logger logger;
  final GraphQLService graphQL;

  OtpBloc(
    this.logger,
    this.graphQL,
    this.authenticationLocalDataSource,
    this.authenticationRepository,
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
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<OtpState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<OtpState> _sendOtpHandler(int dialCode, String phoneNumber) async* {
    bool failed = false;
    AuthFailure? failure;
    yield OtpState.loadingSending();

    // final either = await authenticationRepository.resendConfirmationEmail(email);
    // either.fold((l) {
    //   failed = true;
    //   failure = l;
    // }, (r) {
    //   failed = false;
    // });
    
    // if (failed)
    //   yield OtpState.loadingFailed(failure!);
    // else
      yield OtpState.loadingSent();
  }

  Stream<OtpState> _verifyOtpHandler(String otp) async* {
    bool failed = false;
    AuthFailure? failure;
    yield OtpState.loadingInProgress();

    // final either = await authenticationRepository.resendConfirmationEmail(email);
    // either.fold((l) {
    //   failed = true;
    //   failure = l;
    // }, (r) {
    //   failed = false;
    // });
    
    // if (failed)
    //   yield OtpState.loadingFailed(failure!);
    // else
      yield OtpState.loadingSuccess();
  }

}