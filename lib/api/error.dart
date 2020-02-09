import 'package:dio/dio.dart';
import 'package:numbers/common/logger.dart';

String getError(dynamic error, StackTrace stacktrace) {
  var errorDescription = 'Something went wrong';
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = 'Request to API server was cancelled';
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = 'Connection timeout with API server';
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
            'Connection to API server failed due to internet connection';
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = 'Receive timeout in connection with API server';
        break;
      case DioErrorType.RESPONSE:
        if (error != null &&
            error.response != null &&
            error.response.statusCode != null) {
          errorDescription =
              'Received invalid status code: ${error.response.statusCode}';
        }
        if (error != null && error.response != null) {
          if (error.response.data != null) {
            if (error.response.data is Map) {
              errorDescription = error.response.data['message'];
            } else if (error.response.data is String) {
              errorDescription = error.response.data;
            }
          }
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = 'Send timeout in connection with API server';
        break;
    }
  } else {
    errorDescription = 'Unexpected error occured';
  }
  logger.e(
      'Error is: $error  \nDescription is: $errorDescription \nstackTrace is: $stacktrace');
  return errorDescription;
}
