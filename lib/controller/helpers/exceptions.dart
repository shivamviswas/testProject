class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message = 'error fetching data'])
      : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, '');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, '');
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = 'invalid input'])
      : super(message, '');
}

class InternetException extends AppException {
  InternetException(
      [String message =
      'It looks like you are not connected to the internet. Please check your connection and try again.'])
      : super(message, '');
}