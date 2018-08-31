import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherListScreen(title: 'Weather in Hamburg'),
    );
  }
}

class WeatherListScreen extends StatefulWidget {
  WeatherListScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeatherListScreenState createState() => new _WeatherListScreenState();
}

class _WeatherListScreenState extends State<WeatherListScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('test'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
