import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  const Todo(this.title, this.description);
}

List<Todo> _todos = [
  
];

void main() =>
    runApp(MaterialApp(title: 'Todo App', home: TodoScreen(todos: _todos)));

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  //Initialize state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todos[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(todo: _todos[index])));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final Todo? newTodo = await showDialog<Todo>(
              context: context,
              builder: (BuildContext context) {
                String? title;
                String? description;
                return AlertDialog(
                  alignment: Alignment.center,
                  title: const Text('Create new todo task'),
                  content: Column(children: <Widget>[
                    TextField(
                        onChanged: (value) => title = value,
                        decoration:
                            const InputDecoration(labelText: 'Add todo')),
                    TextField(
                      onChanged: (value) => description = value,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                  ]),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          if (title != null && description != null) {
                            Navigator.pop(context, Todo(title!, description!));
                          }
                        },
                        child: const Text('Add'))
                  ],
                );
              },
            );
            if (newTodo != null) {
              setState(() {
                _todos.add(newTodo);
              });
            }
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Text(todo.description)),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Go back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]),
      ),
    );
  }
}

