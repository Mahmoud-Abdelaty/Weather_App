import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/constants.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/app_text_style.dart';
import 'package:weather_app/features/home_screen/cubit/current_weather_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherGetSuccess) {
          return Scaffold(
            backgroundColor: const Color(0xFF080917),
            body: Padding(
              padding: EdgeInsets.only(top: screenWidth(context) - 290),
              child: Column(
                children: [
                  Text(
                    state.weather[0].main.toString(),
                    style: AppTextStyle.regular(
                        fontSize: screenWidth(context) / 11,
                        color: AppColorsTextDark.primary),
                  ),
                  Text(
                    '19',
                    style: AppTextStyle.regular(
                        fontSize: screenWidth(context) / 7,
                        color: AppColorsTextDark.primary),
                  ),
                  Text(
                    state.weather[0].description.toString(),
                    style: AppTextStyle.semiBold(
                        fontSize: screenWidth(context) / 19,
                        color: AppColorsTextDark.primary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'H:24',
                        style: AppTextStyle.semiBold(
                            fontSize: screenWidth(context) / 19,
                            color: AppColorsTextDark.primary),
                      ),
                      SizedBox(width: screenWidth(context) / 25),
                      Text(
                        'L:18',
                        style: AppTextStyle.semiBold(
                            fontSize: screenWidth(context) / 19,
                            color: AppColorsTextDark.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth(context) / 10),
                  Image.asset(AppImages.house),
                ],
              ),
            ),
          );
        } else if (state is CurrentWeatherInitial) {
          return Center(child: const CircularProgressIndicator());
        } else {
          return const Text('Erorrrrrrrrrrrr');
        }
      },
    );
  }
}
