import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_example/forecast.dart';

class WeatherAPIClient {
  final _apiKey = 'dd4a9320bbd6adc3052fae784f1040b9';
  final _baseUrl = 'http://api.openweathermap.org/data/2.5';

  final HttpClient _httpClient = HttpClient();

  Future<Forecast> requestForecastForCity(String city) async {
    final forecastRoute = '/forecast?appid=$_apiKey&units=metric&q=$city,de';
    final url = _baseUrl + forecastRoute;
    final request = await _httpClient.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      String rawResponse = await response.transform(utf8.decoder).join();
      Map<String, dynamic> json = JsonCodec().decode(rawResponse);
      return Forecast.fromJson(json);
    } else {
      throw Exception();
    }
  }
}