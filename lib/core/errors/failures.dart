import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeOut with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recive timeOut with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure('Bad response');
      case DioExceptionType.cancel:
        return ServerFailure('Request to server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        } else {
          return ServerFailure('Unexpected error , please try again later');
        }
      default:
        return ServerFailure('Unexpected error , please try again later');
    }
  }

   factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (response == null) {
      return ServerFailure('No response data received, Please try again.');
    }

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          response['error']?['message'] ?? 'Authentication error');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops! There was an Error, Please try again');
    }
  }
}
