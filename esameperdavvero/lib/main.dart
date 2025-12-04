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
      title: 'Esame Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
      ),
      home: const MyHomePage(title: 'App di recensione di ristoranti'),
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
  String _displayText = "Elenco recensioni!"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _displayText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          width: 150,
        child: FloatingActionButton.extended(
         icon: const Icon(Icons.add),
          onPressed: _createTodo,
          label: const Text('Aggiungi!'),
          ),
          ), 
         const SizedBox (width: 20),
        ],
         )
    );
  }

  Future<void> _createTodo() async {
    final result = await showDialog<Personal>(
      context: context,
      builder: (context) {
        return AddFormDialog();
      },
    );

    if (result == null) return; 

    setState(() {
      _displayText = "${result.title} - ${result.comment} - ${result.ratingfields} stelle";
    });
  }
}