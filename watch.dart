import 'package:flutter/material.dart';

void main() => runApp(WatchApp());

class WatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WatchScreen(),
    );
  }
}

class WatchScreen extends StatefulWidget {
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  String _time = '';

  @override
  void initState() {
    super.initState();
    _startTimeUpdates();
  }

  void _startTimeUpdates() {
    // Start a timer that updates the time every second
    Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _time = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat.Hms().format(now);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch'),
      ),
      body: Center(
        child: Text(
          _time,
          style: TextStyle(fontSize: 48.0),
        ),
      ),
    );
  }
}
