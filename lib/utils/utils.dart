import 'package:intl/intl.dart';

class Utils {
  static String location = "Pakistan,Karachi";

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

  static List<String> weekDays() {
    return [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday',
    ];
  }
}
