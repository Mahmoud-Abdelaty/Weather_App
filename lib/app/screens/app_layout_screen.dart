import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/cubit/app_layout_cubit.dart';
import 'package:weather_app/app/custom_nav_bar.dart';
import 'package:weather_app/app/data/model/nav_bar_model.dart';
import 'package:weather_app/core/utils/icon_broken.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NavBarModel> navList = [
      NavBarModel(icon: IconBroken.Home, label: 'Home'),
      NavBarModel(icon: IconBroken.Search, label: 'Search'),
      NavBarModel(icon: IconBroken.Bookmark, label: 'Save'),
      NavBarModel(icon: IconBroken.Profile, label: 'Profile'),
    ];
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        final cubit = context.read<AppLayoutCubit>();
        return Scaffold(
          body: Stack(
            children: [
              cubit.screens[context.read<AppLayoutCubit>().currentIndex],
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomNavVar(cubit: cubit),
              ),
            ],
          ),
        );
      },
    );
  }
}
