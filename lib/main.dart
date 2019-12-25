import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print('Total regret = $_counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _neverSatisfied() async {
      _incrementCounter();

      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Rewind and remember'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You will never be satisfied.'),
                  Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Regret'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        RaisedButton(
          child: Text('Make a regret'),
          onPressed: () {
            _neverSatisfied();
          },
        ),
      ]),
    );
  }
}
