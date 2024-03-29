import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_mdoel.dart';
import '../../ui/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(WeatherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String cityName})async{
    try{
      weatherModel =
      await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    }catch(e)
    {
      emit(WeatherFailureState(e.toString()));
    }
  }
}

