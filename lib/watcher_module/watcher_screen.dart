import 'package:flutter/material.dart';

class WatcherScreen extends StatefulWidget {
  const WatcherScreen({Key? key}) : super(key: key);

  @override
  State<WatcherScreen> createState() => _WatcherScreenState();
}

class _WatcherScreenState extends State<WatcherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Watcher'),
      ),
    );
  }
}
