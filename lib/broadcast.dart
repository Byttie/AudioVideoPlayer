import 'package:flutter/material.dart';
import 'drawer.dart';
import 'custom.dart';
import 'battery.dart';


class BroadcastReceiver extends StatefulWidget {
  const BroadcastReceiver({super.key});

  @override
  State<BroadcastReceiver> createState() => _BroadcastReceiverState();
}

class _BroadcastReceiverState extends State<BroadcastReceiver> {
  String selectedBroadcastType = 'Custom broadcast receiver';
  
  final List<String> broadcastTypes = [
    'Custom broadcast receiver',
    'System battery notification receiver'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broadcast Receiver'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Broadcast Receiver',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedBroadcastType,
              isExpanded: true,
              items: broadcastTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedBroadcastType = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Selected: $selectedBroadcastType'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _handleBroadcastSelection();
              },
              child: Text('Select Broadcast'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleBroadcastSelection() {
    if (selectedBroadcastType == 'Custom broadcast receiver') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomBroadcast()),
      );
    } else if (selectedBroadcastType == 'System battery notification receiver') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BatteryStatus()),
      );
    }
  }
}