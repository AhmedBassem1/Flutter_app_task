import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
   final String errMessage;
 const Failure(this.errMessage);
}

class ServerFailure extends Failure {
 ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
  switch (dioException.type) {
   case DioExceptionType.connectionTimeout:
    return ServerFailure('Connection timeout with API server');

   case DioExceptionType.sendTimeout:
    return ServerFailure('Send timeout with API server');

   case DioExceptionType.receiveTimeout:
    return ServerFailure('Receive timeout with API server');

   case DioExceptionType.badCertificate:
    return ServerFailure('Bad certificate from API server');

   case DioExceptionType.badResponse:
    final statusCode = dioException.response?.statusCode;
    final data = dioException.response?.data;
    return ServerFailure.fromResponse(statusCode, data);

   case DioExceptionType.cancel:
    return ServerFailure('Request to API server was cancelled');

   case DioExceptionType.connectionError:
    if (dioException.error is SocketException) {
     return ServerFailure('No Internet connection');
    }
    return ServerFailure('Connection error with API server');    
   case DioExceptionType.unknown:
    return ServerFailure('Oops, there was an unexpected error');
    case DioExceptionType.transformTimeout:
      // TODO: Handle this case.
      throw UnimplementedError();
  }
 }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
  if (statusCode == 400 || statusCode == 401 || statusCode == 402 || statusCode == 429) {
   return ServerFailure(response['error']?['message'] ?? 'Unauthorized request');
  } else if (statusCode == 404) {
   return ServerFailure('Your request was not found');
  } else if (statusCode == 500) {
   return ServerFailure('Internal server error');
  } else {
   return ServerFailure('Oops, there was an unknown error');
  }
 }
}