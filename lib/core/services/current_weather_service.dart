// import 'package:dio/dio.dart';
// import 'package:weather_app/features/home_screen/data/model/current_weather-model.dart';
//
// class CurrentWeatherService {
//   final Dio dio;
//
//   CurrentWeatherService(this.dio);
//
//   Future<List<Weather>?> getCurrentWeather() async {
//     try {
//       Response response = await dio.get(
//           'https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&appid=b346476a925b389e70c3bdd963e9c41f');
//       Map<String, dynamic> jsonData = response.data;
//       List<dynamic> weatherData = jsonData["weather"];
//
//       List<Weather> weatherList = [];
//
//       for (var data in weatherData) {
//         weatherList.add(Weather.fromJson(data));
//       }
//       print(weatherList);
//       return weatherList;
//     } catch (e) {
//       print('Error fetching weather data: $e');
//       return null;
//     }
//   }
// }
