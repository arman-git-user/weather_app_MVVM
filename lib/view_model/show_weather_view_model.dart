import 'package:flutter/cupertino.dart';
import 'package:weather_app/repository/weather_repo.dart';
import '../models/weather_location_model.dart';
import '../utils/utils.dart';

class ShowWeatherViewModel extends ChangeNotifier {

  WeatherModel? weather;

  bool _isLoading = false;
  bool isMatched = false;
  String? error;

  bool get loading => _isLoading;

  String _currentCity = "Karachi";

  Future<void> fetchWeatherByCity(String city) async {

    if (city.trim().isNotEmpty) {
      _currentCity = city.trim();
    }

    _isLoading = true;
    error = null;
    notifyListeners();

    try {

      final data = await WeatherRepo.APIData(
        location: _currentCity,
      );

      weather = WeatherModel.fromJson(data);

      String currentWeekDay = Utils.selectedWeekDay();

      if (currentWeekDay == Utils.weekDays()[Utils.currentSelectedDate]) {
        isMatched = true;
      } else {
        isMatched = false;
      }

    } catch (e) {
      error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
