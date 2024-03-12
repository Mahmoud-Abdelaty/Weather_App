import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_text_style.dart';

class MoreDataWidget extends StatelessWidget {
  const MoreDataWidget({
    super.key,
    required this.image,
    required this.type,
    required this.data,
    required this.paddingRight,
    required this.paddingLeft,
  });

  final String image;
  final String type;
  final String data;
  final double paddingRight;
  final double paddingLeft;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        Padding(
          padding: EdgeInsets.only(left: paddingLeft.w, right: paddingRight.w),
          child: Text(
            type,
            style: AppTextStyle.medium(
              color: AppColors.white,
              fontSize: 18.sp,
            ),
          ),
        ),
        Text(
          data,
          style: AppTextStyle.medium(
            color: AppColors.white,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
