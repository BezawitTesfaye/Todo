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
      home: const Todo(),
    );
  }
}
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  TodoState createState() => TodoState();
}
class TodoState extends State<Todo> {
  // Todo(String s, {Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  // List<String> items=["abc", "def", "ghi", "klm", "nop"];
  final List<TodoNote> todoNotes = [
    TodoNote('some note', 'Beza'),
    TodoNote('another note', 'Achileas')
  ];

  void _updateNote() {
    setState(() {
      todoNotes.add(TodoNote(controller.text, 'Beza'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(todoNotes[index]),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(todoNotes[index].note)),
                  );
                },
                itemCount: todoNotes.length,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Add Todo'),
              ),
            ),
            FloatingActionButton(
              onPressed: _updateNote,
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
