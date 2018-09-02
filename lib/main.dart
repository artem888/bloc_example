import 'dart:async';

import 'package:bloc_example/forecast_bloc.dart';
import 'package:bloc_example/forecast_bloc_provider.dart';
import 'package:bloc_example/forecast_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final bloc = ForecastBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ForecastBlocProvider(
        bloc: bloc,
        child: WeatherListScreen(
          title: 'Weather in Hamburg',
        ),
      )
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
  bool _firstTimeLoad = true;

  @override
  Widget build(BuildContext context) {
    ForecastBloc bloc = ForecastBlocProvider.of(context).bloc;

    if (_firstTimeLoad) {
      bloc.fetchForecastForCity('Hamburg');
      _firstTimeLoad = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<ForecastBlocState>(
          initialData: bloc.getCurrentState(),
          stream: bloc.forecastStream,
          builder: _buildBody
      ),
    );
  }

  Widget _buildBody(BuildContext context,
      AsyncSnapshot<ForecastBlocState> snapshot) {
    if (snapshot.data.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ForecastList(
      forecast: snapshot.data.forecast,
      refreshCallback: _handleRefresh,
    );
  }

  Future<Null> _handleRefresh() async {
    ForecastBloc bloc = ForecastBlocProvider.of(context).bloc;

    bloc.fetchForecastForCity('Hamburg');

    await bloc.forecastStream.first;

    return null;
  }
}
