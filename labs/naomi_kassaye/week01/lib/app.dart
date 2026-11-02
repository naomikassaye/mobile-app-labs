import 'package:flutter/material.dart';

class CampusCompanionApp extends StatelessWidget {
  const CampusCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Companion',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF00695C),
        useMaterial3: true,
      ),
      home: const AboutScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Companion')),
      body: const Center(child: Text('Welcome to Campus Companion')),
    );
  }
}

class AboutScreen extends StatelessWidget{
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        ),
      body: const Column(
        children: [
          Text('Naomi Kassaye Tuffa'),
          Text('Computer Science'),
        ],
        ),
    );
  }
}

