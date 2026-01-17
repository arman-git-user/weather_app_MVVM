import 'package:weather_app/data/response/status.dart';

class APIResponse<T>{
  String? message;
  Status? status;
  T? data;

  APIResponse(this.data,this.message,this.status);

  APIResponse.Completed(): status = Status.COMPLETED;
  APIResponse.Error(): status = Status.ERROR;
  APIResponse.Loading(): status = Status.LOADING;
@override
String toString(){
  return'Status:$status\nData:$data\nMessage:$message';
}
}