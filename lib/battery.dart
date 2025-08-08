import 'package:flutter/material.dart'; //prev
import 'package:battery_plus/battery_plus.dart';
import 'drawer.dart';
import 'dart:async';

class BatteryStatus extends StatefulWidget {
  const BatteryStatus({super.key});

  @override
  State<BatteryStatus> createState() => _BatteryStatusState();
}

class _BatteryStatusState extends State<BatteryStatus> {

  var battery = Battery(); 
  int batterylevel = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchBatteryLevel();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _fetchBatteryLevel();
    });
  }

  void _fetchBatteryLevel() async {
    int level = await battery.batteryLevel;
    if (level != batterylevel) {
      setState(() {
        batterylevel = level;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Status'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Battery Level: $batterylevel%'),
            ElevatedButton(
              onPressed: () async {
                _fetchBatteryLevel();
              },
              child: Text('Get Battery Level'),
            ),
          ],
          ),
        ),
      ),
    );
  }
}


