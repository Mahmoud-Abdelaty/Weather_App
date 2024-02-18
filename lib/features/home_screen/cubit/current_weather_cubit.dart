import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/home_screen/data/model/current_weather-model.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit() : super(CurrentWeatherInitial());

  Future<void> getCurrentLocationAndWeather() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition();
      String latitude = position.latitude.toString();
      String longitude = position.longitude.toString();

      Response response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=b346476a925b389e70c3bdd963e9c41f');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> weatherData = jsonData["weather"];
      Map<String, dynamic> mainData = jsonData["main"];

      List<Weather> weatherList = [];

      for (var data in weatherData) {
        weatherList.add(Weather.fromJson(data));
      }

      print(jsonData);
      print("ddddd $mainData");

      emit(CurrentWeatherGetSuccess(weatherList, Main.fromJson(mainData)));
    } catch (e) {
      emit(CurrentWeatherGetError(e.toString()));
    }
  }
}
