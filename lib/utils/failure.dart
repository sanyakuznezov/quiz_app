import 'package:dio/dio.dart';

class Failure implements Exception {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;

  factory Failure.fromDioError(DioError dioError) {
    return Failure(mapDioErrorToMessage(dioError));
  }

  static String mapDioErrorToMessage(DioError dioError) {
    String message = '';

    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = dioError.message;
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
    return message;
  }
}
