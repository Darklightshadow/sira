class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class NetworkException implements Exception {
  final String message;
  const NetworkException({this.message = 'Pas de connexion internet.'});

  @override
  String toString() => 'NetworkException: $message';
}

class UnauthorizedException implements Exception {
  const UnauthorizedException();

  @override
  String toString() => 'UnauthorizedException: Session expirée.';
}

class NotFoundException implements Exception {
  final String message;
  const NotFoundException({this.message = 'Ressource introuvable.'});

  @override
  String toString() => 'NotFoundException: $message';
}

class ServerException implements Exception {
  const ServerException();

  @override
  String toString() => 'ServerException: Erreur serveur.';
}
