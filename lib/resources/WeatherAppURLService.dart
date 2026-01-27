class WeatherAppUrlService {
  static const API_KEY = 'A9YR8BRMMXT6NREUJSC6S43VZ';
  static String BaseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/';
  static String URL =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Pakistan,Karachi/2026-01-16/2026-01-22?key=A9YR8BRMMXT6NREUJSC6S43VZ&include=days&elements=temp,tempmax,tempmin,conditions';

  static String returnURL(String Location, String startDate, String endDate) {
    return '$BaseUrl/$Location/$startDate/$endDate?key=$API_KEY&include=days&elements=temp,tempmax,tempmin,conditions';
  }
}
