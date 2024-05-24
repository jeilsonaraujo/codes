import 'package:dio/dio.dart';
import 'package:word_wise/core/exceptions.dart';

class DioWrapper {
  final Dio dio;

  DioWrapper({required this.dio});

  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final result = await dio.get(path);
      return result.data;
    } on DioException catch (exception, stackTrace) {
      final hasStatusCode = exception.response != null && exception.response!.statusCode != null;
      final statusCode = exception.response!.statusCode!;
      if (hasStatusCode && statusCode > 400 && statusCode < 500) {
        switch (statusCode) {
          case 404:
            throw ClientErrorNotFound(message: 'Not Found on API', stackTrace: stackTrace, exception: exception);
          default:
            throw ClientErrorNotMapped(message: 'Client error not mapped yet', stackTrace: stackTrace, exception: exception);
        }
      }
      if (hasStatusCode && statusCode > 500) {
        switch (statusCode) {
          case 500:
            throw ServerErrorInternalError(message: 'Internal server error', stackTrace: stackTrace, exception: exception);
          case 503:
            throw ServerErrorServiceUnavailable(message: 'Service not available', stackTrace: stackTrace, exception: exception);
          default:
            throw ServerErrorNotMapped(message: 'Server error not mapped yet', stackTrace: stackTrace, exception: exception);
        }
      }
    }
  }
}
