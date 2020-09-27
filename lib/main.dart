import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Spring Button';

  Timer _timer;
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  Widget _customButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 32.0,
        bottom: 16.0,
        left: 32.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                _counter.toString(),
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 64.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              _customButton(
                'Increment',
                Color(0xFFC41A3B),
              ),
              onTapDown: (_) => _increment(),
              onLongPress: () => _timer = Timer.periodic(
                Duration(milliseconds: 50),
                (_) => _increment(),
              ),
              onLongPressEnd: (_) {
                _timer?.cancel();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              _customButton(
                'Decrement',
                Color(0xFF1B1F32),
              ),
              onTapDown: (_) => _decrement(),
              onLongPress: () => _timer = Timer.periodic(
                Duration(milliseconds: 50),
                (_) => _decrement(),
              ),
              onLongPressEnd: (_) {
                _timer?.cancel();
              },
            ),
          ),
        ],
      ),
    );
  }
}
