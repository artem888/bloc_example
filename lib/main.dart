import 'package:bloc_example/weather_api_client.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  _WeatherListScreenState createState() => _WeatherListScreenState();
}

class _WeatherListScreenState extends State<WeatherListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
