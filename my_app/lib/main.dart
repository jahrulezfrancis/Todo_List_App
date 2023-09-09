import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(home: Scaffold(body: Center(child: Counter()))));

class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _intialCount = 0;
  void _increment() {
    setState(() {
      _intialCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(onPressed: _increment, child: const Text('Add Count')),
        Text('You pressed the button $_intialCount times.')
      ],
    );
  }
}
