import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/data/models/image_model.dart';
import 'package:foodyn_eatery/core/data/models/user_model.dart';
import 'package:foodyn_eatery/core/domain/entities/app_failure.dart';
import 'package:foodyn_eatery/core/domain/repositories/i_management_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'management_event.dart';
part 'management_state.dart';
part 'management_bloc.freezed.dart';

@injectable
class ManagementBloc extends Bloc<ManagementEvent, ManagementState> {
  final IManagementRepository _managementRepository;
  final Logger _logger;

  ManagementBloc(this._logger, this._managementRepository) : super(ManagementState(type: ManagementStateType.initial()));

  @override
  Stream<ManagementState> mapEventToState(
    ManagementEvent gEvent,
  ) async* {
    yield* gEvent.when(
      started: () => _startedHandler(),
      getEateries: () => _getEateriesHandler(),
      getEatery: (id) => _getEateryHandler(id),
      addEatery: (eateryModel, files) => _addEateryHandler(eateryModel, files),
    );
  }

  @override
  void onEvent(ManagementEvent event) {
    _logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<ManagementState> change) {
    _logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<ManagementState> _startedHandler() async* {
    AppFailure? appFailure;
    List<EateryModel> eateryModelList = [];

    yield state.copyWith(type: ManagementStateType.loadingInProgress());
    (await _managementRepository.getEateries()).fold((failure) {
      appFailure = failure;
    }, (value) {
      eateryModelList = value!;
    });
    if (appFailure != null)
      yield state.copyWith(type: ManagementStateType.loadingFailed(appFailure!));
    if (appFailure == null)
    yield state.copyWith(type: ManagementStateType.loadingSuccess(),
      eateries: eateryModelList
    );
  }

  Stream<ManagementState> _getEateriesHandler() async* {
    AppFailure? appFailure;
    List<EateryModel> eateryModelList = [];

    yield state.copyWith(type: ManagementStateType.loadingInProgress());
    (await _managementRepository.getEateries()).fold((failure) {
      appFailure = failure;
    }, (value) {
      eateryModelList = value!;
    });
    if (appFailure != null)
      yield state.copyWith(type: ManagementStateType.loadingFailed(appFailure!));
    if (appFailure == null)
    yield state.copyWith(type: ManagementStateType.loadingSuccess(),
      eateries: eateryModelList
    );
  }

  Stream<ManagementState> _getEateryHandler(int id) async* {
    AppFailure? appFailure;
    EateryModel? eateryModel;
    List<EateryModel> eateryModelList = [];

    yield state.copyWith(type: ManagementStateType.loadingInProgress());
    (await _managementRepository.getEatery(id)).fold((failure) {
      appFailure = failure;
    }, (value) {
      eateryModel = value!;
    });
    if (appFailure != null)
      yield state.copyWith(type: ManagementStateType.loadingFailed(appFailure!));
    else {
      if (this.state.eateries != null)
        eateryModelList = this.state.eateries!;
      eateryModelList.forEachIndexed((index, element) {
        if (eateryModelList[index].id == eateryModel!.id)
          eateryModelList[index] = eateryModel!;
      });
      yield state.copyWith(type: ManagementStateType.loadingSuccess(),
        eateries: eateryModelList
      );
    }
  }

  Stream<ManagementState> _addEateryHandler(EateryModel eateryModel, List<File> files) async* {
    AppFailure? appFailure;

    yield state.copyWith(type: ManagementStateType.loadingInProgress());
    (await _managementRepository.saveEatery(eateryModel)).fold((failure) {
      appFailure = failure;
    }, (value) {
      eateryModel = value!;
    });
    if (appFailure != null)
      yield state.copyWith(type: ManagementStateType.loadingFailed(appFailure!));
    else {
      if (files.isNotEmpty)
      {
        (await _managementRepository.uploadEateryImages(files, eateryModel.id!)).fold((failure) {
          appFailure = failure;
        }, (value) {
        });
        if (appFailure != null)
          yield state.copyWith(type: ManagementStateType.loadingFailed(appFailure!));
      }
      if (appFailure == null)
      {
        yield state.copyWith(
          type: ManagementStateType.loadingSuccess(),
        );
      }
    }
  }

}
