import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> taskList = [
  const Todo('Clean the house',
      'Clean tho whole house and remove all curb webs from the ceiling'),
  const Todo('Improve printing function',
      'Work on the palading store printing function and make the elements dynamic'),
  const Todo('Get some rest',
      'Drink plenty of water and sleep the hell out of your life!')
];

void main() => runApp(MaterialApp(
      title: 'App',
      home: TodoScreen(todos: taskList),
    ));

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TodoDetailScreen(todo: todos[index])));
              },
            );
          }),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Text(todo.description),
      ),
    );
  }
}
