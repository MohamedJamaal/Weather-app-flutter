import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_wether_cubit.dart';
import 'package:weather_app/views/home_view.dart';
// import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWetherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWetherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                // colorSchemeSeed: Colors.amber,
                // useMaterial3: true,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWetherCubit>(context)
                      .weatherModel
                      ?.waetherCondition,
                ),
                useMaterial3: false,
              ),
              // theme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'clear':
      return Colors.blue;
    case 'clouds':
    case 'overcast':
      return Colors.grey;
    case 'patchy rain nearby':
    case 'rain':
      return Colors.blueGrey;
    case 'snow':
      return Colors.lightBlue;
    case 'thunderstorm':
    case 'drizzle':
      return Colors.deepPurple;
    case 'mist':
    case 'fog':
      return Colors.brown;
    case 'sunny':
      return Colors.orange;
    default:
      return Colors.green;
  }
}
