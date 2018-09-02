import 'package:bloc_example/forecast.dart';
import 'package:flutter/material.dart';

class ForecastList extends StatelessWidget {
  final Forecast forecast;
  final RefreshCallback refreshCallback;

  ForecastList({
    this.forecast,
    this.refreshCallback
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshCallback,
      child: _forecastList(),
    );
  }

  ListView _forecastList() {
    var widgets = <Widget>[];
    for (var i = 0; i < forecast.temperatures.length; i++) {
      widgets.add(
        ForecastRow()
      );
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: widgets,
    );
  }
}

class ForecastRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('test'),
    );
  }
}