import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StateLess",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // limpa o controller quando for liberado
    myController.dispose();
    super.dispose();
  }

  Padding _widgetTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: myController,
      ),
    );
  }

  String nome = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Estudando Statefull"),
              centerTitle: true,
            ),
            body: _widgetTextField(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(myController.text),
                  );
                },
              ),
              tooltip: 'Exibir o Texto',
              child: Icon(Icons.tab),
            )));
  }
}
