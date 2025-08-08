import 'package:flutter/material.dart';
import 'drawer.dart';

class CustomBroadcast extends StatefulWidget {
  const CustomBroadcast({super.key});

  @override
  State<CustomBroadcast> createState() => _CustomBroadcastState();
}

class _CustomBroadcastState extends State<CustomBroadcast> {
  String message = '';
  List<String> broadcastMessages = [];

  void _sendCustomBroadcast() {
    if (message.isNotEmpty) {
      setState(() {
        broadcastMessages.add('Broadcast: $message');
        message = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Broadcast'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter broadcast message',
              ),
              onChanged: (value) {
                message = value;
              },
            ),
            ElevatedButton(
              onPressed: _sendCustomBroadcast,
              child: Text('Send Broadcast'),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: broadcastMessages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(broadcastMessages[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}