import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/cubit/app_layout_cubit.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutStates>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            animationCurve: Curves.easeInOutCubicEmphasized,
            height: 53,
            index: context.read<AppLayoutCubit>().currentIndex,
            color: Colors.transparent.withOpacity(0.2),
            backgroundColor: const Color(0xFF080917),
            onTap: (int index) {
              context.read<AppLayoutCubit>().changeBottomNavBar(index);
            },
            items: context.read<AppLayoutCubit>().items,
          ),
          body: context
              .read<AppLayoutCubit>()
              .screens[context.read<AppLayoutCubit>().currentIndex],
        );
      },
    );
  }
}
