abstract class WWException extends Error {}

class ClientErrorNotFound extends WWException {
  final String message;

  @override
  final StackTrace? stackTrace;
  final Exception? exception;
  ClientErrorNotFound({required this.message, this.stackTrace, this.exception});
}

class ClientErrorNotMapped extends WWException {
  final String message;

  @override
  final StackTrace? stackTrace;
  final Exception? exception;
  ClientErrorNotMapped({required this.message, this.stackTrace, this.exception});
}

class ServerErrorInternalError extends WWException {
  final String message;

  @override
  final StackTrace? stackTrace;
  final Exception? exception;
  ServerErrorInternalError({required this.message, this.stackTrace, this.exception});
}

class ServerErrorServiceUnavailable extends WWException {
  final String message;

  @override
  final StackTrace? stackTrace;
  final Exception? exception;
  ServerErrorServiceUnavailable({required this.message, this.stackTrace, this.exception});
}

class ServerErrorNotMapped extends WWException {
  final String message;

  @override
  final StackTrace? stackTrace;
  final Exception? exception;
  ServerErrorNotMapped({required this.message, this.stackTrace, this.exception});
}
