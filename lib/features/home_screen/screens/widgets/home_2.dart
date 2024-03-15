import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/app_text_style.dart';
import 'package:weather_app/features/home_screen/cubit/current_weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      AppImages.snow,
      AppImages.moon,
      AppImages.sun,
    ];
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherGetSuccess) {
          int itemCount = 3;
          return Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
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
            child: CarouselSlider.builder(
              itemCount: itemCount,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return SizedBox(
                  height: 380.h,
                  width: 233.w,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 95.h,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 230.h,
                          decoration: BoxDecoration(
                            color: AppColors.containerData,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Positioned(
                            top: 155.h,
                            child: Padding(
                              padding: EdgeInsets.only(left: 18.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemIndex.toString(),
                                    style: AppTextStyle.bold(
                                      color: AppColors.brown,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
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
                                                      offset:
                                                          const Offset(2, -23),
                                                      child: Text(
                                                        '°C',
                                                        style:
                                                            AppTextStyle.medium(
                                                          fontSize: 14.sp,
                                                          color:
                                                              AppColors.brown,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            DateFormat('EEEE, hh a')
                                                .format(DateTime.now())
                                                .replaceAll('AM', 'am')
                                                .replaceAll('PM', 'pm'),
                                            style: AppTextStyle.medium(
                                              color: AppColors.brown
                                                  .withOpacity(0.5),
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 72.w,
                                            height: 16.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.pink
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            child: Text(
                                              'description',
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
                                              'main',
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
                        ),
                      ),
                      Positioned(
                        bottom: 175.h,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          AppImages.moon,
                          width: 299.w,
                          height: 298.h,
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: itemCount > 1 && itemCount > 2 ? 0.6 : 0.9,
                scrollPhysics:
                    itemCount > 1 ? null : const NeverScrollableScrollPhysics(),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
            ),
          );
        } else if (state is CurrentWeatherInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Erorrrrrrrrrrrr');
        }
      },
    );
  }
}
