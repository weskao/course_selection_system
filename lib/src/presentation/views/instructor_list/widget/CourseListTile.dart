import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseListTile extends StatelessWidget {
  final Course course;

  const CourseListTile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
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
                  course.name,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  course.schedule,
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
