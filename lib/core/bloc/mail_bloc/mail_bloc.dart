import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../data/models/user_model.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/repositories/i_auth_repository.dart';

part 'mail_bloc.freezed.dart';
part 'mail_event.dart';
part 'mail_state.dart';

@injectable
class MailBloc extends Bloc<MailEvent, MailState> {
  final IAuthRepository _authRepository;
  final Logger _logger;
  
  MailBloc(
    this._logger,
    this._authRepository,
  ) : super(_Initial());

  @override
  Stream<MailState> mapEventToState(
    MailEvent gEvent,
  ) async* {
    yield* gEvent.when(
      confirmationEmailStatus: () => _confirmationEmailStatusHandler(),
      resendConfirmationEmail: (email) => _resendConfirmationEmailHandler(email)
    );
  }

  @override
  void onEvent(MailEvent event) {
    _logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<MailState> change) {
    _logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<MailState> _resendConfirmationEmailHandler(String email) async* {
    AppFailure? appFailure;
    yield MailState.loadingInProgress();

    final either = await _authRepository.resendConfirmationEmail(email);
    either.fold((failure) {
      appFailure = failure;
    }, (value) {
    });
    if (appFailure != null)
      yield MailState.loadingFailed(appFailure!);
    else
      yield MailState.loadingSuccess(null);
  }

  Stream<MailState> _confirmationEmailStatusHandler() async* {
    AppFailure? appFailure;
    UserModel? user;

    yield MailState.loadingInProgress();
    final either = await _authRepository.getUser();
    either.fold((failure) {
      appFailure = failure;
    }, (value) {
      user = value;
    });
    if (appFailure != null)
      yield MailState.loadingFailed(appFailure!);
    else
      yield MailState.loadingSuccess(user);
  }
  
}
