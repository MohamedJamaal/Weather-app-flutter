class WeatherModel {
  final String cityName;
  final String image;
  final DateTime date;
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
      cityName: json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      waetherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
