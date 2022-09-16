import 'package:flutter/material.dart';

class CreatorScreen extends StatefulWidget {
  const CreatorScreen({Key? key}) : super(key: key);

  @override
  State<CreatorScreen> createState() => _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Creator'),
      ),
    );
  }
}
