import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/app_text_style.dart';
import 'package:weather_app/features/home_screen/cubit/current_weather_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherGetSuccess) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.pinkBackground,
                    AppColors.indigoBackground,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400.h,
                    width: 230.w,
                    child: Stack(
                      children: [
                        Container(
                          width: 230.w,
                          height: 247.h,
                          decoration: BoxDecoration(
                            color: AppColors.containerData,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 18.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Los Angeles, CA, USA',
                                  style: AppTextStyle.bold(
                                    color: AppColors.brown,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 76.w,
                                      height: 90.h,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '15',
                                              style: AppTextStyle.bold(
                                                color: AppColors.brown,
                                                fontSize: 64.sp,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(2, -23),
                                                child: Text(
                                                  '°C',
                                                  style: AppTextStyle.medium(
                                                    fontSize: 14.sp,
                                                    color: AppColors.brown,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' Sunday, 11 am',
                                              style: AppTextStyle.medium(
                                                color: AppColors.brown
                                                    .withOpacity(0.5),
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 47.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 72.w,
                                          height: 16.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                AppColors.pink.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          child: Text(
                                            'Strong Winds',
                                            style: AppTextStyle.medium(
                                              color: AppColors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Container(
                                          width: 50.w,
                                          height: 16.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.purple
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          child: Text(
                                            'Cloudy',
                                            style: AppTextStyle.medium(
                                              color: AppColors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -150.h, // Adjust the top position as needed
                          right: 0.w, // Adjust the right position as needed
                          child: Image.asset(
                            AppImages.moon,
                            width: 221.w,
                            height: 191.h,
                            fit: BoxFit
                                .cover, // Ensure the image covers the specified area
                          ),
                        ),
                        Positioned(
                          top: 225.h,
                          left: 35.w,
                          child: Container(
                            width: 163.w,
                            height: 47.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.r),
                              color: AppColors.indigo,
                            ),
                            child: Text(
                              'VIEW STATS',
                              style: AppTextStyle.bold(
                                color: AppColors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        } else if (state is CurrentWeatherInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Erorrrrrrrrrrrr');
        }
      },
    );
  }
}
