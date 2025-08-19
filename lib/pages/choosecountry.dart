import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/timeservice.dart';

class Choosecountry extends StatefulWidget {
  const Choosecountry({super.key});

  @override
  State<Choosecountry> createState() => _ChoosecountryState();
}

class _ChoosecountryState extends State<Choosecountry> {
  List<String> countries = [];
  timezones() async {
    var uri = Uri.https('timeapi.io', '/api/timezone/availabletimezones');
    var response = await get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        countries = List<String>.from(data);
      });
    } else {
      throw Exception('Failed to load timezones');
    }
  }

  @override
  void initState() {
    super.initState();
    timezones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Choose Country'),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(countries[index]),
            onTap: () async {
              var timemodel = await TimeService().getTime(countries[index]);
              Navigator.pop(context, {'instance': timemodel});
            },
          );
        },
      ),
    );
  }
}
