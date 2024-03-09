import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/app/data/model/nav_bar_model.dart';
import 'package:weather_app/core/utils/icon_broken.dart';
import 'package:weather_app/features/forecast/screens/forecast_screen.dart';
import 'package:weather_app/features/home_screen/screens/home_screen.dart';
import 'package:weather_app/features/search_screen/screens/settings_screen.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(InitialAppLayoutState());

  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    ForeCastScreen(),
    HomeScreen(),
  ];

  List<NavBarModel> navList = [
    NavBarModel(icon: IconBroken.Home, label: 'Home'),
    NavBarModel(icon: IconBroken.Search, label: 'Search'),
    NavBarModel(icon: IconBroken.Bookmark, label: 'Save'),
    NavBarModel(icon: IconBroken.Profile, label: 'Profile'),
  ];

  int currentIndex = 0;
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }
}
