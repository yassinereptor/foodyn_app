import 'package:equatable/equatable.dart';

/// General Failures
abstract class Failure extends Equatable {
  final List<dynamic> propreties;

  Failure([this.propreties = const <dynamic>[]]);

  @override
  List<dynamic> get props => propreties;
}

/// Server Failures
class ServerFailure extends Failure {
  final int? status;
  final String? message;

  ServerFailure({this.status, this.message}) : super([status, message]);
}

/// Cache Failures
class CacheFailure extends Failure {}

/// Network Failures
class NetworkFailure extends Failure {}

/// ExceptionFailure
class ExceptionFailure extends Failure {
  final String? message;

  ExceptionFailure({this.message}) : super([message]);
}

class GeolocationFailure extends Failure {
  final int status;
  final String message;

  GeolocationFailure({required this.status, required this.message}) : super([status, message]);
}