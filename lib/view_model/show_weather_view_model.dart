import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/repository/weather_repo.dart';

import '../models/weather_location_model.dart';
import '../utils/utils.dart';

class ShowWeatherViewModel extends ChangeNotifier {
  WeatherRepo? weatherRepo;
  WeatherModel? weather;

  String location = "Pakistan,Karachi";
  String startDate = "2026-01-28";
  String endDate = "2026-02-03";
  bool _isLoading = false;
  bool isMatched = false;

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
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }
  void returnMatchedColor(){

  }

}
