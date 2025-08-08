import 'package:flutter/material.dart';
import 'drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
    );
  }
}