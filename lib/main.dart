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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Favorite',
                ),
                Icon(
                  Icons.audiotrack,
                  color: Colors.red,
                  size: 24.0,
                ),
                Icon(
                  Icons.unarchive,
                  color: Colors.grey,
                  size: 24.0,
                ),
                Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 24.0,
                ),
                Icon(
                  Icons.exit_to_app,
                  color: Colors.yellow,
                  size: 24.0,
                ),
                Icon(
                  Icons.share,
                  color: Colors.green,
                  size: 24.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
