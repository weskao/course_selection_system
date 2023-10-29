import 'package:course_selection_system/generated/assets.gen.dart';
import 'package:course_selection_system/src/presentation/views/instructor_list/widget/CourseListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/mock/MockData.dart';
import '../../widgets/PrimaryPage.dart';
import '../../widgets/toggle_list/toggle_list.dart';

class InstructorListPage extends StatelessWidget {
  const InstructorListPage({Key? key}); // Fixed the constructor declaration.

  @override
  Widget build(BuildContext context) {
    ;

    return PrimaryPage(
      title: "講師清單",
      topWidget: ToggleList(
        itemBorderDecoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(3.r),
        ),
        itemPadding: EdgeInsets.all(10.r),
        trailing: const Icon(Icons.add),
        trailingExpanded: const Icon(Icons.remove),
        children: List.generate(MockData.instructorList.length, (instructorIndex) {
          var courseList = MockData.instructorList[instructorIndex].courseList;

          return ToggleListItem(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: AssetGenImage(MockData.instructorList[instructorIndex].imageUrl).image(width: 40.r, height: 40.r),
                ),
                SizedBox(width: 10.r),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MockData.instructorList[instructorIndex].rankName, // Fixed the property name.
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color.fromRGBO(163, 163, 163, 1),
                      ),
                    ),
                    SizedBox(height: 5.r),
                    Text(
                      MockData.instructorList[instructorIndex].name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(courseList.length, (courseIndex) {
                return CourseListTile(course: courseList[courseIndex]);
              }),
            ),
          );
        }),
      ),
    );
  }
}
