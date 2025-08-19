import 'package:world_time/models/timemodel.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TimeService {
  Future<TimeModel> getTime(String timeZone) async {
    var uri = Uri.https('timeapi.io', '/api/time/current/zone', {
      'timeZone': timeZone,
    });
    var response = await get(uri);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return TimeModel(
        date: data['date'],
        time: data['time'],
        timezone: data['timeZone'],
        dayOfWeek: data['dayOfWeek'],
        dateTime: data['dateTime'],
      );
    } else {
      throw Exception('Failed to load time data');
    }
  }
}
