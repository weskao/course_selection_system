import 'package:course_selection_system/src/core/extensions/list_widget_space_between_extension.dart';
import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:course_selection_system/src/presentation/utils/RouteUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/PrimaryPage.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  static String TAG = "CourseDetailPage";

  const CourseDetailPage({super.key, required this.course});

  static push(BuildContext context, Course course) => Navigator.push(context, getCupertinoPageRoute(TAG, CourseDetailPage(course: course)));

  @override
  Widget build(BuildContext context) {
    return PrimaryPage(
      title: "課程資訊",
      topWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.name,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "課程描述: ${course.description}",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
          Text(
            "上課時間: ${course.getSchedule()}",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
          Text(
            "授課講師: ${course.instructor}",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ].withSpaceBetween(height: 5.r),
      ),
    );
  }
}
