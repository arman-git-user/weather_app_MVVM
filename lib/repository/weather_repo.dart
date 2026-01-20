import 'package:weather_app/data/network/base_api_services.dart';
import 'package:weather_app/data/network/network_api_services.dart';
import 'package:weather_app/resources/WeatherAppURLService.dart';

class WeatherRepo {
  final BaseAPIServices apiServices = NetworkAPIServices();

  Future<Map<String,dynamic>> APIData(
    String Location,
    String startDate,
    String endDate,
  ) async{
    try{
      Map<String,dynamic> response = await apiServices.getGetAPIService(
        WeatherAppUrlService.returnURL(Location, startDate, endDate),

      );

      return response;
    }
    catch (e){
      rethrow;
    }

  }
}
