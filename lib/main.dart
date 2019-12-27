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

enum Answers { MONEY, GAME, NOTHING }

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _value = 'Nothing!';

  void _setValue(String value) => setState(() => _value = value);

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

    void _setting() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Saved Suggestions'),
              ),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("All save : "),
                    IconButton(icon: Icon(Icons.list), onPressed: _setting),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    Future<void> _demoDialogNavigator() async {
      _incrementCounter();

      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('How you want to navigate'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  FlatButton(
                    child: Text('Navigate'),
                    onPressed: _setting,
                  ),
                  FlatButton(
                    child: Text('Navigate close dialog'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _setting();
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _demoAlertDialog() async {
      _incrementCounter();

      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('How you want to navigate'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Beware!!"),
                  Text("Don't touch this button again!!"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _demoSimpleDialog() async {
      switch (await showDialog(
          context: context,
          child: new SimpleDialog(
            title: new Text("Do you like ?"),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text("Money"),
                onPressed: () {
                  Navigator.pop(context, Answers.MONEY);
                },
              ),
              new SimpleDialogOption(
                child: new Text("Game"),
                onPressed: () {
                  Navigator.pop(context, Answers.GAME);
                },
              ),
              new SimpleDialogOption(
                child: new Text("Nothing!"),
                onPressed: () {
                  Navigator.pop(context, Answers.NOTHING);
                },
              )
            ],
          ))) {
        case Answers.MONEY:
          _setValue('MONEY');
          break;
        case Answers.GAME:
          _setValue("GAME");
          break;
        case Answers.NOTHING:
          _setValue("NOTHING");
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Center(
            child: Text("Here is what we had '$_value'",
                textAlign: TextAlign.center)),
        RaisedButton(
          child: Text('Make a regret'),
          onPressed: () {
            _neverSatisfied();
          },
        ),
        RaisedButton(
          child: Text('Open dialog with navigator'),
          onPressed: () {
            _demoDialogNavigator();
          },
        ),
        RaisedButton(
          child: Text('Open simple dialog'),
          onPressed: () {
            _demoSimpleDialog();
          },
        ),
        RaisedButton(
          child: Text('Open alert dialog'),
          onPressed: () {
            _demoAlertDialog();
          },
        ),
      ]),
    );
  }
}
