import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/repository/weather_repo.dart';

import '../models/weather_location_model.dart';

class ShowWeatherViewModel extends ChangeNotifier {
  WeatherRepo? weatherRepo;
  WeatherModel? weather;

  // String location = "Pakistan,Karachi";
  // String startDate = "2026-01-17";
  // String endDate = "2026-01-23";
  bool _isLoading = false;

  bool get loading => _isLoading;
  String? error;

  Future<void> FetchWeather() async {
    _isLoading = true;
    notifyListeners();
    try {
      Map<String, dynamic> data = await WeatherRepo.APIData();
      // print(data);

      if (data != null) {
        weather = WeatherModel.fromJson(data);
        print(weather);
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }
}
