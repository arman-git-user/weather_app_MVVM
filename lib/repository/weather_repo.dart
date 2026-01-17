import 'package:weather_app/data/network/base_api_services.dart';
import 'package:weather_app/data/network/network_api_services.dart';
import 'package:weather_app/resources/WeatherAppURLService.dart';

class WeatherRepo {
  final BaseAPIServices apiServices = NetworkAPIServices();

  Future<dynamic> APIData(
    String Location,
    DateTime startDate,
    DateTime endDate,
  ) {
    try{
      dynamic response = apiServices.getGetAPIService(
        WeatherAppUrlService.returnURL(Location, startDate, endDate),
      );
      return response;
    }
    catch (e){
      rethrow;
    }

  }
}
