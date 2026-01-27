import 'package:weather_app/data/network/base_api_services.dart';
import 'package:weather_app/data/network/network_api_services.dart';
import 'package:weather_app/resources/WeatherAppURLService.dart';

import '../models/weather_location_model.dart';

class WeatherRepo {
  static final BaseAPIServices apiServices = NetworkAPIServices();

  // static WeatherModel? weather;
  static Future<Map<String, dynamic>> APIData() async {
    try {
      Map<String, dynamic> response = await apiServices.getGetAPIService(
        WeatherAppUrlService.URL,
      );
      // print(response);
      // weather = WeatherModel.fromJson(response);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
