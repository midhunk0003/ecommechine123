abstract class Failure {
  final String? message;
  final int? StatusCode;

  Failure({this.message, this.StatusCode});
}

class ServerFailure extends Failure {
  ServerFailure(String? message) : super(message: message);
}

class LoginFailure extends Failure {
  LoginFailure(String? message) : super(message: message);
}

class ClientFailure extends Failure {
  ClientFailure(String? message) : super(message: message);
}

class OtherFailureNon200 extends Failure {
  OtherFailureNon200(String? message) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure(String? message) : super(message: message);
}
