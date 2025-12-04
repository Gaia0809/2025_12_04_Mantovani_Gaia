import 'package:flutter/material.dart';
import 'package:esame/form.dart';
import 'package:esame/input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recensioni ristoranti',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
      ),
      home: const MyHomePage(title: 'Recensione ristoranti'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _list = <Rewiew>[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            if (_list.isEmpty)
             Text("Non ci sono recensioni, aggiungine una!"),
            for (final (i, todo) in _list.indexed)
              ListTile(
                  title: Text(todo.title),
                  subtitle: todo.comment != null ? Text(todo.comment!) : null,
                  trailing: Row(children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text("${todo.ratingfields}"),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _deleteTodo(i);
                        });
                      },
                    ),
                    IconButton( 
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          _editTodo(i);
                        });
                      },
                    ),
                  ],) 
                  
                ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
        onPressed: _createTodo,
        icon: const Icon(Icons.add),
        label: Text('Aggiungi una recensione!')
      ),
    );
  }

  Future<void> _createTodo() async {
    final result = await showDialog<Rewiew>(
      context: context,
      builder: (context) {
        return const AddFormDialog();
      },
    );

    if (result == null) return;

    setState(() {
      _list.add(result);
    });
  }

  Future<void> _editTodo(int index) async {
    final result = await showDialog<Rewiew>(
      context: context,
      builder: (context) {
        return const AddFormDialog();
      },
    );

    if (result == null) return;

    setState(() {
      _list[index] = result;
    });
  }

  Future<void> _deleteTodo(int index) async {
    setState(() {
      _list.removeAt(index);
    });
  }
}