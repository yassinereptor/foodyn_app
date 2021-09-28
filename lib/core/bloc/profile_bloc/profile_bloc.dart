import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodyn_rest/core/data/models/membership_model.dart';
import '../../data/models/coupon_model.dart';
import '../../domain/entities/app_failure.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../data/models/profile_model.dart';
import '../../enums/image.type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepository _profileRepository;
  final Logger _logger;

  ProfileBloc(
    this._logger,
    this._profileRepository,
  ) : super(_Initial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent gEvent,
  ) async* {
    yield* gEvent.when(
      uploadImage: (type, file) => _uploadImageHandler(type, file),
      saveProfile: (profile) => _saveProfileHandler(profile),
      saveMembership: (planId, periodId, couponId) => _saveMembershipHandler(planId, periodId, couponId),
      checkCouponStatus: (code) => _checkCouponStatus(code)
    );
  }

  @override
  void onEvent(ProfileEvent event) {
    _logger.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<ProfileState> change) {
    _logger.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _logger.e(error);
    super.onError(error, stackTrace);
  }

  Stream<ProfileState> _uploadImageHandler(ImageType type, File file) async* {
    AppFailure? appFailure;
    yield ProfileState.loadingInProgress();

    (await _profileRepository.uploadImage(ImageType.PROFILE, file)).fold((failure) {
      appFailure = failure;
    }, (value) {
    });
    if (appFailure != null)
      yield ProfileState.loadingFailed(appFailure!);
    else
      yield ProfileState.loadingSuccess();
  }


  Stream<ProfileState> _saveProfileHandler(ProfileModel profile) async* {
    AppFailure? appFailure;
    ProfileModel? profileModel;

    (await _profileRepository.saveProfile(profile)).fold((failure) {
      appFailure = failure;
    }, (value) {
      profileModel = value;
    });
    if (appFailure != null)
      yield ProfileState.loadingFailed(appFailure!);
    else
      yield ProfileState.loadingProfileSuccess(profileModel);
  }

  Stream<ProfileState> _saveMembershipHandler(int planId, int periodId, int? couponId) async* {
    AppFailure? appFailure;
    MembershipModel? membershipModel;

    (await _profileRepository.saveMembership(planId, periodId, couponId)).fold((failure) {
      appFailure = failure;
    }, (value) {
      membershipModel = value;
    });
    if (appFailure != null)
      yield ProfileState.loadingFailed(appFailure!);
    else
      yield ProfileState.loadingMembershipSuccess(membershipModel);
  }

  Stream<ProfileState> _checkCouponStatus(String code) async* {
    AppFailure? appFailure;
    CouponModel? coupon;

    if (code.isEmpty)
      yield ProfileState.initial();
    else {
      (await _profileRepository.checkCouponStatus(code)).fold((failure) {
        appFailure = failure;
      }, (value) {
        coupon = value;
      });
      if (appFailure != null || coupon == null)
        yield ProfileState.loadingFailed((appFailure != null) ? appFailure! : AppFailure.local());
      else
        yield ProfileState.loadingCouponSuccess(coupon);
    }
  }
}
