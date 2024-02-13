import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_states.dart';
import 'package:weather_app/ui/screen/home/home_screen.dart';
import 'package:weather_app/ui/screen/search/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GetWeatherCubit(),
      child: Builder(
        builder:(context)=> BlocBuilder<GetWeatherCubit, WeatherState>(
          builder:(context, state)=> MaterialApp(
            theme: ThemeData(
              primarySwatch:getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherCondition,
              ),
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              HomeScreen.routeName:(_)=> HomeScreen(),
              SearchScreen.routeName:(_)=> SearchScreen()
            },
            initialRoute: HomeScreen.routeName,
          ),
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if(condition == null)
    {
      return Colors.blue;
    }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Cloudy":
    case "partly Cloudy":
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Thundery outbreaks possible":
    case "Blowing snow":
    case "Blizzard":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
      return Colors.lightBlue;
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy snow possible":
    case "Patchy light snow with thunder":
    case "Heavy rain at times":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy moderate snow":
    case "Moderate or heavy snow":
    case "Patchy heavy snow":
    case "Ice pellets":
    return Colors.cyan;
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.amber;
    default:
      return Colors.grey;
  }
}
