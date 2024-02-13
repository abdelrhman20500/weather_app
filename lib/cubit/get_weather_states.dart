import 'package:weather_app/model/weather_mdoel.dart';

/// weather state have three states ok so when you use class weather state in cubit
/// remember that class have three states
class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState{
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}