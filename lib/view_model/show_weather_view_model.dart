import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/repository/weather_repo.dart';

import '../models/weather_location_model.dart';

class ShowWeatherViewModel extends ChangeNotifier {
  WeatherRepo weatherRepo = WeatherRepo();
  WeatherLocationModel? weather;
  String location = "Pakistan,Karachi";
  String startDate ="2026-01-17";
  String endDate = "2026-01-23";
  bool _isLoading = false;
  bool get loading=>_isLoading;
  String? error;

  Future<void> fetchWeather() async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await weatherRepo.APIData(location, startDate, endDate);

      weather = WeatherLocationModel.fromJson(data);
    } catch (e) {
    error =  e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
