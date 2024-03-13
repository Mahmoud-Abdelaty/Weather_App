import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_text_style.dart';

class BoxData extends StatelessWidget {
  const BoxData({
    super.key,
    required this.country,
    required this.temperature,
    required this.main,
    required this.date,
    required this.description,
  });

  final String country;
  final num temperature;
  final int date;
  final String main;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275.h,
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
                    country,
                    style: AppTextStyle.bold(
                      color: AppColors.brown,
                      fontSize: 20.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: ((temperature - 273.15).floor())
                                        .toString(),
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
                                ],
                              ),
                            ),
                          ),
                          Text(
                            DateFormat('EEEE hh a')
                                .format(DateTime.fromMillisecondsSinceEpoch(
                                    date * 1000))
                                .replaceAll('AM', 'am')
                                .replaceAll('PM', 'pm'),
                            style: AppTextStyle.medium(
                              color: AppColors.brown.withOpacity(0.5),
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 72.w,
                            height: 16.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.pink.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              description,
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
                              color: AppColors.purple.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              main,
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
    );
  }
}
