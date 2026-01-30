import 'package:weather_app/data/network/base_api_services.dart';
import 'package:weather_app/data/network/network_api_services.dart';
import 'package:weather_app/resources/WeatherAppURLService.dart';
import 'package:weather_app/utils/utils.dart';

import '../models/weather_location_model.dart';

class WeatherRepo {
  static final BaseAPIServices apiServices = NetworkAPIServices();

  // static WeatherModel? weather;
  static Future<Map<String, dynamic>> APIData() async {
    try {
      Map<String, dynamic> response = await apiServices.getGetAPIService(
        WeatherAppUrlService.returnURL(Utils.location,Utils.DateOfMonday(),Utils.DateAfter7Days()),
      );
      print(response);
      print('Current day: ${Utils.currentSelectedDate}');
      // weather = WeatherModel.fromJson(response);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
