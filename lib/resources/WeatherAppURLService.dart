class WeatherAppUrlService {

  static const API_KEY = 'A9YR8BRMMXT6NREUJSC6S43VZ';

  static const String baseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/';

  static String returnURL(
      String location,
      String startDate,
      String endDate,
      ) {

    final encodedLocation = Uri.encodeComponent(location);

    return '$baseUrl$encodedLocation/$startDate/$endDate'
        '?key=$API_KEY'
        '&unitGroup=metric'
        '&include=days'
        '&elements=temp,tempmax,tempmin,conditions';
  }
}
