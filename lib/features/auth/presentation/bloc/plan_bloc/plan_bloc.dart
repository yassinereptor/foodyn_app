import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodyn_rest/core/models/plan_model.dart';
import 'package:foodyn_rest/core/services/graphql_service.dart';
import 'package:foodyn_rest/features/auth/data/datasources/authentication_local_data_source.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/domain/repositories/i_authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'plan_event.dart';
part 'plan_state.dart';
part 'plan_bloc.freezed.dart';

@injectable
class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final IAuthenticationRepository authenticationRepository;
  final IAuthenticationLocalDataSource authenticationLocalDataSource;
  final Logger logger;
  final GraphQLService graphQL;

  PlanBloc(
    this.logger,
    this.graphQL,
    this.authenticationLocalDataSource,
    this.authenticationRepository,
  ) : super(_Initial());

  @override
  Stream<PlanState> mapEventToState(
    PlanEvent gEvent,
  ) async* {
    yield* gEvent.when(
      getPlans: () => _getPlansHandler()
    );
  }

  @override
  void onEvent(PlanEvent event) {
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<PlanState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<PlanState> _getPlansHandler() async* {
    bool failed = false;
    AuthFailure? failure;
    List<PlanModel>? plans;
    yield PlanState.loadingInProgress();

    final either = await authenticationRepository.getPlans();
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      plans = r;
    });
    
    if (failed)
      yield PlanState.loadingFailed(failure!);
    else
      yield PlanState.loadingSuccess(plans);
  }
}
