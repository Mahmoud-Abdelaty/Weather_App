import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/cubit/app_layout_cubit.dart';
import 'package:weather_app/app/screens/app_layout_screen.dart';
import 'package:weather_app/features/home_screen/cubit/current_weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppLayoutCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CurrentWeatherCubit()..getCurrentLocationAndWeather(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: AppLayoutScreen(),
      ),
    );
  }
}
