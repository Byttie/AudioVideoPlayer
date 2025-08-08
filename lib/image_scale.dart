import 'package:flutter/material.dart';
import 'drawer.dart';

class ImageScale extends StatelessWidget {
  const ImageScale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Scale'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 5.0,
          child: Image.asset(
            "images/meme.png",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}