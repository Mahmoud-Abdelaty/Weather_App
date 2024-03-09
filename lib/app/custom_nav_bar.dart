import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_text_style.dart';

class CustomNavVar extends StatelessWidget {
  const CustomNavVar({super.key, required this.cubit});

  final cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 48.h, 17.w, 20.h),
      child: Container(
        width: 343.w,
        height: 64.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(left: 33.w),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              cubit.changeBottomNavBar(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  cubit.navList[index].icon,
                  size: 24.sp,
                  color: cubit.currentIndex == index
                      ? AppColors.pinkSecondary
                      : AppColors.gray,
                ),
                SizedBox(height: 3.h),
                if (cubit.currentIndex == index)
                  Text(
                    cubit.navList[index].label,
                    style: AppTextStyle.medium(
                      color: AppColors.pinkSecondary,
                      fontSize: 12.sp,
                    ),
                  ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(width: 50.w),
          itemCount: cubit.navList.length,
        ),
      ),
    );
  }
}
