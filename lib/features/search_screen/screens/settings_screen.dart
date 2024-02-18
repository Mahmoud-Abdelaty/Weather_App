import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_text_style.dart';
import 'package:weather_app/core/utils/icon_broken.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080917),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // CurrentWeatherService(Dio()).getCurrentWeather();
              },
              icon: Icon(IconBroken.Location),
            ),
            Text(
              'Location',
              style: AppTextStyle.black(
                color: AppColorsTextDark.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
