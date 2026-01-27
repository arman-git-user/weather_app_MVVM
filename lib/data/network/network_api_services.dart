import 'dart:convert';
import 'dart:io';

import 'package:weather_app/data/app_exception.dart';
import 'package:weather_app/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkAPIServices extends BaseAPIServices {
  @override
   Future<dynamic> getGetAPIService(String Url) async {
    // TODO: implement getGetAPIService
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(Url))
          .timeout(Duration(seconds: 10));
      jsonResponse = returnJsonResponse(response);
      return jsonResponse;
    } on SocketException {
      throw FetchDataException();
    }
  }

   returnJsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Map<String,dynamic> jsonResponse = jsonDecode(response.body);
        // print(jsonResponse);

        return jsonResponse;
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 500:
        throw FetchDataException("Server error");
      default:
        throw FetchDataException("Unexpected error");
    }
  }
}
