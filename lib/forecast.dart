class Forecast {
  List<double> temperatures;
  List<DateTime> times;

  Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['list'];

    this.temperatures = list.map((value) {
      return value['main']['temp'] as double;
    }).toList();

    this.times = list.map((value) {
      var timestamp = value['dt'] as int;
      return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    }).toList();
  }
}