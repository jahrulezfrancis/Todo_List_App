import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _inputText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Powerful To do List App')),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Catch Phrase'),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ))),
      bottomSheet: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text('You just entered $_inputText as your catch phrase.'),
      ),
    );
  }
}
