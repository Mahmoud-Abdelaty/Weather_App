import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/features/home_screen/screens/widgets/box_data.dart';
import 'package:weather_app/features/home_screen/screens/widgets/more_data_widget.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({
    super.key,
    required this.country,
    required this.temperature,
    required this.main,
    required this.date,
    required this.description,
    required this.image,
    required this.precipitation,
    required this.humidity,
    required this.wind,
  });

  final String country;
  final num temperature;
  final int date;
  final String main;
  final String description;
  final String image;
  final String precipitation;
  final String humidity;
  final String wind;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // left: 65.w,
          // top: 220.h,
          child: BoxData(
            date: date,
            country: country,
            temperature: temperature,
            main: main,
            description: description,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          // child: Image.network(
          //   'https://openweathermap.org/img/wn/$image.png',
          //   width: 299.w,
          //   height: 298.h,
          // ),
          child: Image.asset(
            image,
            width: 299.w,
            height: 298.h,
          ),
        ),
        Positioned(
            bottom: 115.h,
            left: 95.w,
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
                  data: '$humidity%',
                  paddingRight: 24,
                  paddingLeft: 16,
                ),
                MoreDataWidget(
                  image: AppImages.wind,
                  type: 'Wind',
                  data: '$wind km/h',
                  paddingRight: 29,
                  paddingLeft: 17,
                ),
              ],
            )),
      ],
    );
  }
}
