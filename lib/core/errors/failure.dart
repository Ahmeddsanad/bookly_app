import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection Timout with Api Server');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timout with Api Server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timout with Api Server');
      case DioErrorType.response:
        return ServerFailure.response(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to Api Server was canceled');
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, please try again!');
      default:
        return ServerFailure('Oops There was an error, please try again.');
    }
  }

  factory ServerFailure.response(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not found, please try again later.');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, please try again later.');
    } else {
      return ServerFailure('Oops There was an error, please try again.');
    }
  }
}
