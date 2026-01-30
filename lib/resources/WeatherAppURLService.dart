import 'package:intl/intl.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherAppUrlService {
  static const API_KEY = 'A9YR8BRMMXT6NREUJSC6S43VZ';
  static String BaseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/';
  static String location = Utils.location;
  static String startDate = Utils.currentDate;
  static String endDate = Utils.DateAfter7Days();

  static String returnURL(String location, String startDate, String endDate) {
    return '$BaseUrl $location/$startDate/$endDate?key=$API_KEY&include=days&elements=temp,tempmax,tempmin,conditions';
    // $BaseUrl/Pakistan,Karachi/2026-01-28/2026-02-03?key=$API_KEY&include=days&elements=temp,tempmax,tempmin,conditions
  }
}
