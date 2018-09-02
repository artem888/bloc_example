import 'dart:async';

import 'package:bloc_example/forecast.dart';
import 'package:bloc_example/weather_api_client.dart';

class ForecastBloc {
  final _apiClient = WeatherAPIClient();

  ForecastBlocState _currentState;

  StreamSubscription<Forecast> _fetchForecastSub;

  final _forecastController = StreamController.broadcast<ForecastBlocState>();
  Stream<ForecastBlocState> get websites => _forecastController.stream;

  ForecastBloc() {
    _currentState = ForecastBlocState.empty();
  }

  ForecastBlocState getCurrentState() {
    return _currentState;
  }

  fetchForecastForCity(String city) {
    _fetchForecastSub?.cancel();

    _currentState.loading = true;
    _forecastController.add(_currentState);

    _apiClient.requestForecastForCity(city)
        .asStream()
        .listen((dynamic forecast) {
          if (forecast is Forecast) {
            _currentState.forecast = forecast;
          }
          _currentState.loading = false;
          _forecastController.add(_currentState);
    });
  }
}

class ForecastBlocState {
  bool loading;
  Forecast forecast;

  ForecastBlocState(this.loading, this.forecast);

  ForecastBlocState.empty() {
    loading = false;
    forecast = null;
  }
}