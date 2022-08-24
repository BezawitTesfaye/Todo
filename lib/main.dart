import 'package:flutter/material.dart';

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
  Todo({Key? key}) : super(key: key);
   List<String> items=["abc", "def", "ghi", "klm", "nop"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(items[index]),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(items[index])),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
