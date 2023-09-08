// import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: const Text('Smart To To do list')),
    body: const HomeWidget(),
  )));
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(width: 100, height: 100, color: Colors.amberAccent),
          Container(width: 100, height: 100, color: Colors.blueGrey),
          Container(width: 100, height: 100, color: Colors.brown.shade700),
        ],
      ),
    );
  }
}
