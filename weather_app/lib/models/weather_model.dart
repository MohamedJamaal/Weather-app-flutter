class WeatherModel {
  final String cityName;
  final String image;
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String waetherCondition;

  WeatherModel(
      {required this.cityName,
      required this.image,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.waetherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['forecast']['name'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        date: json['condition']['last_updated'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        waetherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
