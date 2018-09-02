import 'package:bloc_example/date_utils.dart';
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
        ForecastRow(forecast.temperatures[i], forecast.times[i])
      );
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: widgets,
    );
  }
}

class ForecastRow extends StatelessWidget {
  final double _temperature;
  final DateTime _time;

  ForecastRow(this._temperature, this._time);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0),
            child: Text(
                DateUtils.formattedDate(_time),
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0),
            child: Text('$_temperature C'),
          ),
        ],
      ),
    );
  }
}