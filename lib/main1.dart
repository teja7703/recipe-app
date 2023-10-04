import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterStreamApp(),
    );
  }
}

class CounterStreamApp extends StatefulWidget {
  const CounterStreamApp({Key? key}) : super(key: key);

  @override
  _CounterStreamAppState createState() => _CounterStreamAppState();
}

class _CounterStreamAppState extends State<CounterStreamApp> {
  int _counter = 0;
  bool _isIncrementing = true;
  final _controller = StreamController<bool>();
  //used to toggle between incrementing and decrementing.

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<bool>(
              stream: _controller.stream,
              initialData: true,
              builder: (context, snapshot) {
                final isIncrementing = snapshot
                        .data ?? // Extracting the boolean value from the snapshot's data
                    true;
                return FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      //update the widget's state
                      if (isIncrementing) {
                        if (_counter < 10) {
                          _counter++;
                        } else {
                          _isIncrementing = false;
                        }
                      } else {
                        if (_counter > 0) {
                          _counter--;
                        } else {
                          _isIncrementing = true;
                        }
                      }
                    });
                    _controller.sink.add(_isIncrementing);
                  },
                  child: Text(
                    isIncrementing ? 'inc' : 'dec',
                    style: const TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Count: $_counter',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
