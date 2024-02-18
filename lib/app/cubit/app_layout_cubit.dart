import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/icon_broken.dart';
import 'package:weather_app/features/forecast/screens/forecast_screen.dart';
import 'package:weather_app/features/home_screen/screens/home_screen.dart';
import 'package:weather_app/features/search_screen/screens/settings_screen.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(InitialAppLayoutState());

  bool isDark = false;
  bool isAllow = false;

  void changeMode() {
    isDark = !isDark;
    emit(ChangeModeState());
  }

  void allowNotification() {
    isAllow = !isAllow;
    emit(AllowNotificationState());
  }

  List<Widget> screens = const [
    SearchScreen(),
    HomeScreen(),
    ForeCastScreen(),
  ];

  List<Widget> items = const [
    Icon(
      IconBroken.Search,
      size: 30,
      color: AppColors.quaternary,
    ),
    Icon(
      IconBroken.Home,
      size: 30,
      color: AppColors.quaternary,
    ),
    Icon(
      IconBroken.Category,
      size: 30,
      color: AppColors.quaternary,
    ),
  ];

  int currentIndex = 1;
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }

  String selectedValue = "English";

  List<DropdownMenuItem<String>> dropMenuItems = const [
    DropdownMenuItem(
      value: 'English',
      child: Text(
        'English',
      ),
    ),
    DropdownMenuItem(
      value: 'Arabic',
      child: Text('Arabic'),
    ),
  ];

  void dropValue(String? value) {
    selectedValue = value!;
    emit(SelectLanguage());
  }
}
