import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Gallery3DController controller;
  int itemCount = 3;
  @override
  void initState() {
    controller = Gallery3DController(
      itemCount: itemCount,
      autoLoop: true,
      ellipseHeight: 0,
      minScale: 0.8,
    );
    super.initState();
  }

  Widget buildGallery3D() {
    return Gallery3D(
        controller: controller,
        itemConfig: GalleryItemConfig(
          width: 227.w,
          height: 420.h,
          radius: 10.r,
        ),
        width: MediaQuery.of(context).size.width,
        height: 500,
        // isClip: true,
        onItemChanged: (index) {},
        onClickItem: (index) {
          if (kDebugMode) print("currentIndex:$index");
        },
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Positioned(
                  top: 130.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 225.h,
                    width: 227.w,
                    decoration: BoxDecoration(
                      color: AppColors.containerData,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Positioned(
                      top: 0.h,
                      right: 0,
                      left: 0,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      DateFormat('EEEE, hh a')
                                          .format(DateTime.now())
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
                                        color:
                                            AppColors.purple.withOpacity(0.5),
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
                  bottom: 200.h,
                  right: -20.w,
                  left: -20.w,
                  child: Image.asset(
                    AppImages.moon,
                    width: 299.w,
                    height: 298.h,
                  ),
                ),
                Positioned(
                  top: 330.h,
                  left: 30.w,
                  right: 30.w,
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("demo01"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15.h),
        child: buildGallery3D(),
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.only(top: 80.h),
// child: SizedBox(
// height: 380.h,
// width: 233.w,
// child: Stack(
// children: [
// Positioned(
// top: 95.h,
// left: 0,
// right: 0,
// child: Container(
// height: 230.h,
// decoration: BoxDecoration(
// color: AppColors.containerData,
// borderRadius: BorderRadius.circular(30.r),
// ),
// child: Positioned(
// top: 155.h,
// child: Padding(
// padding: EdgeInsets.only(left: 18.w),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Egypt',
// style: AppTextStyle.bold(
// color: AppColors.brown,
// fontSize: 20.sp,
// ),
// ),
// Row(
// children: [
// Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// SizedBox(
// child: RichText(
// text: TextSpan(
// children: [
// TextSpan(
// text: '15',
// style: AppTextStyle.bold(
// color: AppColors.brown,
// fontSize: 64.sp,
// ),
// ),
// WidgetSpan(
// child: Transform.translate(
// offset: const Offset(2, -23),
// child: Text(
// '°C',
// style: AppTextStyle.medium(
// fontSize: 14.sp,
// color: AppColors.brown,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Text(
// DateFormat('EEEE, hh a')
//     .format(DateTime.now())
//     .replaceAll('AM', 'am')
//     .replaceAll('PM', 'pm'),
// style: AppTextStyle.medium(
// color:
// AppColors.brown.withOpacity(0.5),
// fontSize: 14.sp,
// ),
// ),
// ],
// ),
// SizedBox(width: 20.w),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
// width: 72.w,
// height: 16.h,
// alignment: Alignment.center,
// decoration: BoxDecoration(
// color:
// AppColors.pink.withOpacity(0.5),
// borderRadius:
// BorderRadius.circular(20.r),
// ),
// child: Text(
// 'description',
// style: AppTextStyle.medium(
// color: AppColors.white,
// fontSize: 10.sp,
// ),
// ),
// ),
// SizedBox(height: 4.h),
// Container(
// width: 50.w,
// height: 16.h,
// alignment: Alignment.center,
// decoration: BoxDecoration(
// color:
// AppColors.purple.withOpacity(0.5),
// borderRadius:
// BorderRadius.circular(20.r),
// ),
// child: Text(
// 'main',
// style: AppTextStyle.medium(
// color: AppColors.white,
// fontSize: 10.sp,
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// ),
// Positioned(
// top: -90.h,
// right: 0,
// left: 0,
// child: Image.asset(
// AppImages.moon,
// width: 299.w,
// height: 298.h,
// ),
// ),
// ],
// ),
// ),
// );
