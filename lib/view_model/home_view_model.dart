import 'package:flutter/cupertino.dart';
import 'package:weather_app/repository/weather_repo.dart';
import '../models/weather_location_model.dart';
import '../utils/utils.dart';

class ShowWeatherViewModel extends ChangeNotifier {
  WeatherModel? weather;

  bool _isLoading = false;
  bool _invalidLastSearch = false;
  String? error;
  bool get lastSearch => _invalidLastSearch;
  bool get loading => _isLoading;
  bool isCurrentCityInvalid = false;

  String _currentCity = "Karachi";

  Future<void> fetchWeatherByCity(String city) async {
    if (city.trim().isNotEmpty) {
      _currentCity = city.trim();
    }

    _isLoading = true;
    error = null;
    notifyListeners();

    try {
      final data = await WeatherRepo.APIData(location: _currentCity);

      weather = WeatherModel.fromJson(data);

      String currentWeekDay = Utils.selectedWeekDay();
      _invalidLastSearch = true;
      // notifyListeners();
      isCurrentCityInvalid = false;
      // notifyListeners();

    } catch (e) {
      error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
