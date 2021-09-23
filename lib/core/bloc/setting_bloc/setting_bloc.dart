import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodyn_rest/core/data/datasources/authentication_local_data_source.dart';
import 'package:foodyn_rest/core/data/models/payment_model.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/core/domain/repositories/i_authentication_repository.dart';
import '../../services/graphql_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'setting_event.dart';
part 'setting_state.dart';
part 'setting_bloc.freezed.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final IAuthenticationRepository authenticationRepository;
  final IAuthenticationLocalDataSource authenticationLocalDataSource;
  final Logger logger;
  final GraphQLService graphQL;

  SettingBloc(
    this.logger,
    this.graphQL,
    this.authenticationLocalDataSource,
    this.authenticationRepository,
  ) : super(_Initial());

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent gEvent,
  ) async* {
    yield* gEvent.when(
      getPlans: () => _getPlansHandler(),
      getPayments: () => _getPaymentsHandler()
    );
  }

  @override
  void onEvent(SettingEvent event) {
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<SettingState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<SettingState> _getPlansHandler() async* {
    bool failed = false;
    AuthFailure? failure;
    List<PlanModel>? plans;
    yield SettingState.loadingInProgress();

    final either = await authenticationRepository.getPlans();
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      plans = r;
    });
    
    if (failed)
      yield SettingState.loadingFailed(failure!);
    else
      yield SettingState.loadingPlansSuccess(plans);
  }

  Stream<SettingState> _getPaymentsHandler() async* {
    bool failed = false;
    AuthFailure? failure;
    List<PaymentModel>? payments;
    yield SettingState.loadingInProgress();

    final either = await authenticationRepository.getPayments();
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      payments = r;
    });
    
    if (failed)
      yield SettingState.loadingFailed(failure!);
    else
      yield SettingState.loadingPaymentsSuccess(payments);
  }
}
