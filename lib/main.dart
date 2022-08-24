import 'package:flutter/material.dart';
import 'package:todo/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Todo(),
    );
  }
}

class Todo extends StatelessWidget {
  // Todo(String s, {Key? key}) : super(key: key);
  Todo({Key? key}) : super(key: key);
   // List<String> items=["abc", "def", "ghi", "klm", "nop"];
  final List<TodoNote> todoNotes = [
    TodoNote('some note', 'Beza'),
    TodoNote('another note', 'Achileas')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(todoNotes[index]),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(todoNotes[index].note)),
          );
        },
        itemCount: todoNotes.length,
      ),
    );
  }
}
