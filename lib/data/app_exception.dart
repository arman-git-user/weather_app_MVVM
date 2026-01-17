class AppException implements Exception {
  final _prefix;
  final _message;

  AppException([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix , $_message';
  }
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? prefix])
    : super(prefix, 'Invalid Username or Password');
}

class BadRequestException extends AppException {
  BadRequestException([String? prefix]) : super(prefix, 'Invalid Request');
}

class FetchDataException extends AppException {
  FetchDataException([String? prefix])
    : super(prefix, "Error during communication");
}
