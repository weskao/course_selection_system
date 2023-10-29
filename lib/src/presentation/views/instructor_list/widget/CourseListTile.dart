import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/common/data/CourseDetailData.dart';
import '../../course_detail/CourseDetailPage.dart';

class CourseListTile extends StatelessWidget {
  final CourseDetailData courseDetailData;

  const CourseListTile({super.key, required this.courseDetailData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        CourseDetailPage.push(context, courseDetailData.course, courseDetailData.instructorName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.r),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 2.r, right: 10.r),
              child: Icon(
                Icons.calendar_month,
                size: 20.r,
                color: const Color.fromRGBO(140, 140, 140, 1),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseDetailData.course.name,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  courseDetailData.course.getSchedule(),
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              child: const Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}
