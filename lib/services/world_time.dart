import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime {
  String url;
  String location;
  String flag;
  late String time;
  late bool success;

  WorldTime(this.location, this.url, this.flag);

  Future<void> getTime() async {
    try {
      var response = await http
          .get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      var data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
      success = true;
    } catch (error) {
      print(error);
      time = 'Service Unavailable, please try again later.';
    }
  }
}