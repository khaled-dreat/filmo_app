import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromHttpException(http.Response response) {
    int statusCode = response.statusCode;
    dynamic responseBody = jsonDecode(response.body);

    if (statusCode == 404) {
      return ServerFailure(
          message: 'Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          message: 'There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: responseBody['error']['message']);
    } else {
      return ServerFailure(message: 'There was an error, please try again');
    }
  }
}
