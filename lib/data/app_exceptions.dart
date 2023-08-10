class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error Occure While Communication');
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super(message, '503 Service Unavailabe : No Internet');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super(message, '408 : Request Time Out');
}

class ServerException extends AppExceptions {
  ServerException([String? message])
      : super(message, '500 : Internal Server Error');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message])
      : super(message, '400 Bad Gateway : Invalid URL');
}
