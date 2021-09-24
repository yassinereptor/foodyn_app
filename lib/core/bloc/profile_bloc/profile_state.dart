part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loadingInProgress() = _LoadingInProgress;
  const factory ProfileState.loadingSuccess() = _LoadingSuccess;
  const factory ProfileState.loadingProfileSuccess(ProfileModel? profile) = _LoadingProfileSuccess;
  const factory ProfileState.loadingCouponSuccess(CouponModel? coupon) = _LoadingCouponSuccess;
  const factory ProfileState.loadingFailed(AppFailure failure) = _LoadingFailed;
}
