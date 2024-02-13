import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_states.dart';
import 'package:weather_app/ui/screen/search/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 static const String routeName ="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(onPressed: ()
          {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
              icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state)
              {
                if(state is WeatherInitialState){
                  return const NoWeatherBody();
                }else if (state is WeatherLoadedState)
                  {
                    return WeatherInfoBody(
                      weather:state.weatherModel,
                    );
                  }else{
                  return const Text("app has an error");
                }
              }
      ),
    );
  }
}
