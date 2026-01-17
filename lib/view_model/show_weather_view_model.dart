import 'package:flutter/cupertino.dart';
import 'package:weather_app/repository/weather_repo.dart';

class ShowWeatherViewModel extends ChangeNotifier{
  WeatherRepo? weatherRepo;

Future<void> fetchWeather(){
  final data = weatherRepo.APIData(Location, startDate, endDate)
}
}