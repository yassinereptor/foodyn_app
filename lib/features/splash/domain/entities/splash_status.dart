import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_status.freezed.dart';

@freezed
abstract class SplashStatus with _$SplashStatus {
  const factory SplashStatus.initial() = _Initial;
  const factory SplashStatus.firstTime() = _FirstTime;
  const factory SplashStatus.start() = _Start;
}
