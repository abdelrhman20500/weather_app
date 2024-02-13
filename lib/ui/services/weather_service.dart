import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_mdoel.dart';

class WeatherService{
  WeatherService(this.dio);

  final Dio dio;

  final String baseUrl ="http://api.weatherapi.com/v1";
  final String apiKey="2037b6d663e64260b92192646240602";
  Future<WeatherModel> getCurrentWeather({required String cityName})async{
    try{
      Response response =await dio.get(
          "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
      /// i handle exception in dio package .
    } on DioException catch (e){
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there was an error , try later";
      throw Exception(errorMessage);
    }catch (e){
      throw Exception("oops there was an error , try later");
    }
  }
}