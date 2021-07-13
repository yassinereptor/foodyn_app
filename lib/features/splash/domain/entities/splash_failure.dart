import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_failure.freezed.dart';

@freezed
abstract class SplashFailure with _$SplashFailure {
  const factory SplashFailure.network() = _Network;
  const factory SplashFailure.server({
    required String message,
    required int status,
  }) = _Server;

  const factory SplashFailure.storage() = _Storage;
}
