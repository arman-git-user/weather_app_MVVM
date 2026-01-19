import 'dart:convert';
import 'dart:io';

import 'package:weather_app/data/app_exception.dart';
import 'package:weather_app/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkAPIServices extends BaseAPIServices {
  @override
  Future getGetAPIService(String Url) async {
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

  dynamic returnJsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        return jsonResponse;
      case 400:
        throw BadRequestException();
    }
  }
}
