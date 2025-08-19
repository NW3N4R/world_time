import 'package:intl/intl.dart';

class TimeModel {
  String date;
  String time;
  String timezone;
  String dayOfWeek;
  String dateTime;
  TimeModel({
    required this.date,
    required this.time,
    required this.timezone,
    required this.dayOfWeek,
    required this.dateTime,
  });

  String timeFormatter() {
    DateTime parsedTime = DateTime.parse(dateTime);
    return DateFormat.jm().format(parsedTime);
  }
}
