import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/features/home_screen/cubit/current_weather_cubit.dart';
import 'package:weather_app/features/home_screen/screens/widgets/box_data_widget.dart';
import 'package:weather_app/features/home_screen/screens/widgets/more_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherGetSuccess) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
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
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    BoxData(
                      temperature: state.main.temp!,
                      description: state.weather.description!,
                      main: state.weather.main!,
                      country:
                          '${state.currentWeatherModel.name}, ${state.sys.country}',
                      date: state.currentWeatherModel.dt!,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -10.h,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppImages.moon,
                  width: 299.w,
                  height: 298.h,
                ),
              ),
              Positioned(
                bottom: 115.h,
                left: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MoreDataWidget(
                      image: AppImages.precipitation,
                      type: 'Precipitation',
                      data: '6%',
                      paddingRight: 10,
                      paddingLeft: 23,
                    ),
                    MoreDataWidget(
                      image: AppImages.humidity,
                      type: 'Humidity',
                      data: '${state.main.humidity}%',
                      paddingRight: 24,
                      paddingLeft: 16,
                    ),
                    MoreDataWidget(
                      image: AppImages.wind,
                      type: 'Wind',
                      data: '${state.currentWeatherModel.wind!.speed} km/h',
                      paddingRight: 29,
                      paddingLeft: 17,
                    ),
                  ],
                ),
              ),
            ],
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
