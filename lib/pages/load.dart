import 'package:flutter/material.dart';
import 'package:world_time/services/timeservice.dart';
import 'package:world_time/models/timemodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Load extends StatefulWidget {
  const Load({super.key});

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  String? time = 'loading...';
  TimeModel? timeModel;
  getTime() async {
    timeModel = await TimeService().getTime('Europe/London');
    setState(() {
      time = timeModel?.time;
    });
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {'instance': timeModel},
    );
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(child: SpinKitRipple(color: Colors.white, size: 150.0)),
    );
  }
}
