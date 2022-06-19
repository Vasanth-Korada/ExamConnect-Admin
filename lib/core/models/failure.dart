import 'package:dio/dio.dart';

enum FailureType{
  DATABASE,
  SERVER,
  INTERNET,
  FORMAT,
  GENERAL
}
///generic failure to be used for the error cases
class Failure{
  String? message;
  FailureType? failureType;

  Failure({required this.message,this.failureType = FailureType.GENERAL});

  Failure.fromServerError(DioError error){
    message = error.message;
  }
}