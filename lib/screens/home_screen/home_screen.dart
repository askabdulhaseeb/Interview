import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interview/screens/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  int _counter = 0;
  Stopwatch? _stopwatch;
  _initPage() {
    _stopwatch!.start();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _stopwatch = Stopwatch();
    _initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formatTime(int milliseconds) {
      var secs = milliseconds ~/ 1000;
      var hours = (secs ~/ 3600).toString().padLeft(2, '0');
      var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
      var seconds = (secs % 60).toString().padLeft(2, '0');
      return "$hours:$minutes:$seconds";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                formatTime(_stopwatch!.elapsedMilliseconds),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 50),
              ),
            ),
            Divider(color: Colors.blueGrey),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter = _counter + 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
