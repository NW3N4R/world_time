import 'package:flutter/material.dart';
import 'package:world_time/models/timemodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : (ModalRoute.of(context)?.settings.arguments as Map?) ?? {};
    TimeModel timeModel = data['instance'];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeModel.timezone,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      timeModel.timeFormatter(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      timeModel.date,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(timeModel.dayOfWeek, style: TextStyle(letterSpacing: 4)),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: FilledButton.icon(
                  onPressed: () async {
                    var timemodel = await Navigator.pushNamed(
                      context,
                      '/choosecountry',
                    );
                    setState(() {
                      data = timemodel as Map<dynamic, dynamic>;
                      timeModel = data['instance'];
                    });
                  },
                  icon: const Icon(Icons.edit_location_alt_outlined),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 251, 151, 51),
                  ),
                  label: Text(
                    'Choose Country',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
