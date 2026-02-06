import 'package:weather_app/data/network/base_api_services.dart';
import 'package:weather_app/data/network/network_api_services.dart';
import 'package:weather_app/resources/WeatherAppURLService.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherRepo {

  static final BaseAPIServices apiServices = NetworkAPIServices();

  static Future<Map<String, dynamic>> APIData({
    required String location,
  }) async {

    try {
      final url = WeatherAppUrlService.returnURL(
        location,
        Utils.DateOfMonday(),
        Utils.DateAfter7Days(),
      );

      final response = await apiServices.getGetAPIService(url);

      return response;

    } catch (e) {
      rethrow;
    }
  }
}
