import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String location = "Karachi";
  static String iconController = TextEditingController().text.toString();
  static DateTime now = DateTime.now();
  static int currentSelectedDate = DateTime.now().weekday;
  static String currentDate = DateFormat('yyyy-MM-dd').format(now);
  static String currentWeekDay = DateFormat('EEEE').format(now);
  late String formatForm;

  static String DateOfMonday() {
    switch (currentWeekDay.toLowerCase()) {
      case 'monday':
        String nxt7Days = DateFormat(
          'yyyy-MM-dd',
        ).format(now.add(Duration(days: 6)));
        return nxt7Days;

      case 'tuesday':
        String previousDate = DateFormat(
          'yyyy-MM-dd',
        ).format(now.subtract(Duration(days: 1)));
        // String formatDate = DateFormat('yyyy-MM-dd').format(previousDate);
        return previousDate;

      case 'wednesday':
        String previousDate = DateFormat(
          'yyyy-MM-dd',
        ).format(now.subtract(Duration(days: 2)));
        // String formatDate = DateFormat('yyyy-MM-dd').format(previousDate);
        return previousDate;
      case 'thursday':
        String previousDate = DateFormat(
          'yyyy-MM-dd',
        ).format(now.subtract(Duration(days: 3)));
        // String formatDate = DateFormat('yyyy-MM-dd').format(previousDate);
        return previousDate;
      case 'friday':
        String previousDate = DateFormat(
          'yyyy-MM-dd',
        ).format(now.subtract(Duration(days: 4)));
        // String formatDate = DateFormat('yyyy-MM-dd').format(previousDate);
        return previousDate;

      case 'saturday':
        String previousDate = DateFormat(
          'yyyy-MM-dd',
        ).format(now.subtract(Duration(days: 5)));
        // String formatDate = DateFormat('yyyy-MM-dd').format(previousDate);
        return previousDate;
      case 'sunday':
        String previousDate = DateFormat(
          'yyyy-MM-dd',
        ).format(now.subtract(Duration(days: 6)));
        // String formatDate = DateFormat('yyyy-MM-dd').format(previousDate);
        return previousDate;
      default:
        return "No date calculated";
    }
  }

  static String DateAfter7Days() {
    switch (currentWeekDay.toLowerCase()) {
      case 'monday':
        String nxt7Days = DateFormat(
          'yyyy-MM-dd',
        ).format(now.add(Duration(days: 6)));
        return nxt7Days;

      case 'tuesday':
        DateTime previousDate = now.subtract(Duration(days: 1));
        String nxt7days = DateFormat(
          'yyyy-MM-dd',
        ).format(previousDate.add(Duration(days: 6)));

        return nxt7days;
      case 'wednesday':
        DateTime previousDate = now.subtract(Duration(days: 2));
        String nxt7days = DateFormat(
          'yyyy-MM-dd',
        ).format(previousDate.add(Duration(days: 6)));

        return nxt7days;
      case 'thursday':
        DateTime previousDate = now.subtract(Duration(days: 3));
        String nxt7days = DateFormat(
          'yyyy-MM-dd',
        ).format(previousDate.add(Duration(days: 6)));
        return nxt7days;
      case 'friday':
        DateTime previousDate = now.subtract(Duration(days: 4));
        String nxt7days = DateFormat(
          'yyyy-MM-dd',
        ).format(previousDate.add(Duration(days: 6)));
        print(currentDate);
        return nxt7days;
      case 'saturday':
        DateTime previousDate = now.subtract(Duration(days: 5));
        String nxt7days = DateFormat(
          'yyyy-MM-dd',
        ).format(previousDate.add(Duration(days: 6)));

        return nxt7days;
      case 'sunday':
        DateTime previousDate = now.subtract(Duration(days: 6));
        String nxt7days = DateFormat(
          'yyyy-MM-dd',
        ).format(previousDate.add(Duration(days: 6)));
        return nxt7days;
      default:
        return "No date calculated";
    }
  }

  static String getImage(String name) {
    return ('lib/resources/assets/images/$name');
  }

  static String getIcons(String name) {
    return ('lib/resources/assets/icons/$name');
  }

  static List<String> weekDays() {
    return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  }

  static String selectedWeekDay() {
    List<String> ListOfWeeks = weekDays();
    String currentWeekDay = ListOfWeeks[currentSelectedDate];
    return currentWeekDay;
  }

  static String IconsSelect(String conditions) {
    //clear, (Rain, Partially cloudy),Partially cloudy,Overcast,(Snow, Rain, Partially cloudy),(Snow, Rain, Freezing Drizzle/Freezing Rain, Overcast),

    switch (conditions) {
      case 'clear':
        return Utils.getIcons('MoonCloudFastWind.png');
      case 'Rain, Partially cloudy':
        return Utils.getIcons('MoonCloudMidRain.png');
      case 'Partially cloudy':
        return Utils.getIcons('MoonCloudMidRain.png');
      case 'Overcast':
        return Utils.getIcons('Tornado.png');
      case 'Snow, Rain, Partially cloudy':
        return Utils.getIcons('SunCloudMidRain.png');
      case 'Snow, Rain, Freezing Drizzle/Freezing Rain, Overcast':
        return Utils.getIcons('SunCloudAngledRain.png');

      default:
        return Utils.getIcons('MoonCloudMidRain.png');
    }
  }

  static bool returnColor(index) {
    int currentDate = currentSelectedDate - 1;
    if (index == currentDate) {
      return true;
    } else {
      return false;
    }
  }
}
