import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodyn_rest/core/enums/image.type.dart';
import 'package:foodyn_rest/core/models/profile_model.dart';
import 'package:foodyn_rest/core/models/user_model.dart';
import 'package:foodyn_rest/core/services/graphql_service.dart';
import 'package:foodyn_rest/features/auth/data/datasources/authentication_local_data_source.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/domain/repositories/i_authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IAuthenticationRepository authenticationRepository;
  final IAuthenticationLocalDataSource authenticationLocalDataSource;
  final Logger logger;
  final GraphQLService graphQL;

  ProfileBloc(
    this.logger,
    this.graphQL,
    this.authenticationLocalDataSource,
    this.authenticationRepository,
  ) : super(_Initial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent gEvent,
  ) async* {
    yield* gEvent.when(
      uploadImage: (type, file) => _uploadImageHandler(type, file),
      saveProfile: (profile) => _saveProfileHandler(profile)
    );
  }

  @override
  void onEvent(ProfileEvent event) {
    logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<ProfileState> change) {
    logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<ProfileState> _uploadImageHandler(ImageType type, File file) async* {
    bool failed = false;
    AuthFailure? failure;
    yield ProfileState.loadingInProgress();

    final either = await authenticationRepository.uploadImage(ImageType.PROFILE, file);
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
    });
    
    if (failed)
      yield ProfileState.loadingFailed(failure!);
    else
      yield ProfileState.loadingSuccess();
  }


  Stream<ProfileState> _saveProfileHandler(ProfileModel profile) async* {
    bool failed = false;
    AuthFailure? failure;
    ProfileModel? profileModel;

    final either = await authenticationRepository.saveProfile(profile);
    either.fold((l) {
      failed = true;
      failure = l;
    }, (r) {
      failed = false;
      profileModel = r;
    });
    if (failed)
      yield ProfileState.loadingFailed(failure!);
    else
      yield ProfileState.loadingProfileSuccess(profileModel);
  }
}
