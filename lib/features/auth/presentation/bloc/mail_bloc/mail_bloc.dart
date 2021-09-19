import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodyn_rest/core/models/user_model.dart';
import 'package:foodyn_rest/core/services/graphql_service.dart';
import 'package:foodyn_rest/features/auth/data/datasources/authentication_local_data_source.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/domain/repositories/i_authentication_repository.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'mail_event.dart';
part 'mail_state.dart';
part 'mail_bloc.freezed.dart';

@injectable
class MailBloc extends Bloc<MailEvent, MailState> {
  final IAuthenticationRepository authenticationRepository;
  final IAuthenticationLocalDataSource authenticationLocalDataSource;
  final Logger logger;
  final GraphQLService graphQL;
  
  MailBloc(
    this.logger,
    this.graphQL,
    this.authenticationLocalDataSource,
    this.authenticationRepository,
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
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<MailState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<MailState> _resendConfirmationEmailHandler(String email) async* {
    bool failed = false;
    AuthFailure? failure;
    yield MailState.loadingInProgress();

    final either = await authenticationRepository.resendConfirmationEmail(email);
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
    });
    
    if (failed)
      yield MailState.loadingFailed(failure!);
    else
      yield MailState.loadingSuccess(null);
  }

  Stream<MailState> _confirmationEmailStatusHandler() async* {
    bool failed = false;
    AuthFailure? failure;
    UserModel? userModel;

    yield MailState.loadingInProgress();

    final either = await authenticationRepository.getUser();
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      userModel = r;
    });
    if (failed)
      yield MailState.loadingFailed(failure!);
    else
      yield MailState.loadingSuccess(userModel);
  }
  
}
