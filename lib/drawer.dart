import 'package:flutter/material.dart';
import 'broadcast.dart';
import 'image_scale.dart';
import 'audio.dart';
import 'video.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        children: [
          ListTile(
            title: Text('Options'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BroadcastReceiver()));
            },
            child: Text('Broadcast Receiver'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScale()));
            },
            child: Text('Image Scale'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AudioPlayer()));
            },
            child: Text('Audio Player'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen()));
            },
            child: Text('Video Player'),
          ),
        ],
      ),
    );
  }
} 