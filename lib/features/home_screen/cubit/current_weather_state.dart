part of 'current_weather_cubit.dart';

@immutable
abstract class CurrentWeatherState {}

class CurrentWeatherInitial extends CurrentWeatherState {}

class LocationGetSuccess extends CurrentWeatherState {
  final String latitude;
  final String longitude;
  final String location;
  LocationGetSuccess(this.latitude, this.longitude, this.location);
}

class LocationGetError extends CurrentWeatherState {
  final String error;
  LocationGetError(this.error);
}

class CurrentWeatherGetSuccess extends CurrentWeatherState {
  final Weather weather;
  final Main main;
  CurrentWeatherGetSuccess(this.weather, this.main);
}

class CurrentWeatherGetError extends CurrentWeatherState {
  final String error;
  CurrentWeatherGetError(this.error);
}
