import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/network/endPoints.dart';
import 'package:weather_app/core/network/networkHelpers.dart';
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

      print(longitude);
      print(latitude);
      var response = await NetworkHelper.instance.get(
          endPoint: EndPoints.Current_Weather,
          params: {
            "lat": latitude,
            "lon": longitude,
            "appid": "b346476a925b389e70c3bdd963e9c41f"
          });
      var jsonData = response.data;
      var mainData = jsonData["main"];
      var sysData = jsonData["sys"];
      var weather = jsonData["weather"][0];

      emit(CurrentWeatherGetSuccess(
          CurrentWeatherModel.fromJson(jsonData),
          Weather.fromJson(weather),
          Main.fromJson(mainData),
          Sys.fromJson(sysData)));
    } catch (e) {
      emit(CurrentWeatherGetError(e.toString()));
    }
  }
}
