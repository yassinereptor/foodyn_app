class ServerExeption implements Exception {
  final int? status;
  final String? message;

  ServerExeption({this.status, this.message});
}

class CacheExeption implements Exception {}

class NetworkExeption implements Exception {}
