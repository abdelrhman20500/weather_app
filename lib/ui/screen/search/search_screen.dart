import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_mdoel.dart';
import 'package:weather_app/ui/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
 static const String routeName = "SearchScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            onFieldSubmitted: (value) {
             var getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              /// to make padding for text form field from inside.
              contentPadding: EdgeInsets.symmetric(
                vertical: 32, horizontal: 16,
              ),
              border: OutlineInputBorder(),
              labelText: "Search",
              labelStyle: TextStyle(color: Colors.blue),
              hintText: "Enter city name",
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}

