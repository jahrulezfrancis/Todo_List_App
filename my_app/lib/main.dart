import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _todos = [];

  void _addTodo() {
    showDialog(
        context: context,
        builder: ((BuildContext context) {
          String newTodo = '';
          return AlertDialog(
            title: const Text('Create new task'),
            content: TextField(
                onChanged: (value) => {
                      newTodo = value,
                    }),
            actions: <Widget>[
              TextButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  setState(
                    () {
                      _todos.add(newTodo);
                    },
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Create'),
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
              mouseCursor: SystemMouseCursors.click,
              title: GestureDetector(
                child: Text(
                  todo,
                  style: TextStyle(
                      decoration: todo.startsWith('-')
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                onTap: () {
                  setState(() {
                    if (todo.startsWith('-')) {
                      _todos[index] = todo.substring(2);
                    } else {
                      _todos[index] = '- $todo';
                    }
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    _todos.removeAt(index);
                  });
                },
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
