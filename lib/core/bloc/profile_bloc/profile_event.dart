part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  factory ProfileEvent.uploadImage(ImageType type, File file) = _UploadImage;
  factory ProfileEvent.saveProfile(ProfileModel profile) = _SaveProfile;
  factory ProfileEvent.saveMembership(int planId, int periodId, int? couponId) = _SaveMembership;
  factory ProfileEvent.checkCouponStatus(String code) = _CheckCouponStatus;
}