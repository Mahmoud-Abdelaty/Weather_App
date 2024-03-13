import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/features/home_screen/cubit/current_weather_cubit.dart';
import 'package:weather_app/features/home_screen/screens/widgets/weather_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      AppImages.snow,
      AppImages.moon,
      AppImages.sun,
    ];
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherGetSuccess) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.pinkBackground,
                  AppColors.indigoBackground,
                ],
              ),
            ),
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      WeatherData(
                temperature: state.currentWeatherModel.main!.temp!,
                description: state.currentWeatherModel.weather![0].description!,
                main: state.currentWeatherModel.weather![0].main!,
                country:
                    '${state.currentWeatherModel.name}, ${state.currentWeatherModel.sys!.country}',
                date: state.currentWeatherModel.dt!,
                // image: images[itemIndex],
                image: state.currentWeatherModel.weather![0].icon!,
                humidity: state.currentWeatherModel.main!.humidity.toString(),
                wind: state.currentWeatherModel.wind!.speed.toString(),
                precipitation: state.currentWeatherModel.wind!.speed.toString(),
              ),
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayCurve: Curves.ease,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        } else if (state is CurrentWeatherInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Erorrrrrrrrrrrr');
        }
      },
    );
  }
}
