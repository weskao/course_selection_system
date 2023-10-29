import 'package:course_selection_system/generated/assets.gen.dart';
import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:course_selection_system/src/data/model/course/Instructor.dart';
import 'package:course_selection_system/src/presentation/views/instructor_list/widget/CourseListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/common/data/Time.dart';
import '../../widgets/PrimaryPage.dart';
import '../../widgets/toggle_list/toggle_list.dart';

class InstructorListPage extends StatelessWidget {
  const InstructorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final courseList = [
      Course(
          name: '基礎程式設計',
          description: "基礎程式設計課程",
          dayOfWeek: 2,
          startTime: Time(hour: 10, minute: 0),
          endTime: Time(hour: 12, minute: 0),
          instructor: "Albert Flores"),
      Course(
          name: '人工智慧總整與實作',
          description: "人工智慧總整與實作課程",
          dayOfWeek: 4,
          startTime: Time(hour: 14, minute: 0),
          endTime: Time(hour: 16, minute: 0),
          instructor: "Albert Flores"),
      Course(
          name: '訊號與系統',
          description: "訊號與系統課程",
          dayOfWeek: 5,
          startTime: Time(hour: 10, minute: 0),
          endTime: Time(hour: 12, minute: 0),
          instructor: "Albert Flores"),
    ];

    final instructorList = [
      Instructor(name: "Albert Flores", rankLevel: 1, imageUrl: 'assets/images/default_avatar/default_avatar_2.jpg', courseList: courseList)
    ];

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
        children: [
          ToggleListItem(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: AssetGenImage(instructorList[0].imageUrl).image(width: 40.r, height: 40.r),
                ),
                SizedBox(width: 10.r),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instructorList[0].rankName,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color.fromRGBO(163, 163, 163, 1),
                      ),
                    ),
                    SizedBox(height: 5.r),
                    Text(
                      instructorList[0].name,
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
                children: List.generate(courseList.length, (index) {
                  return CourseListTile(course: courseList[index]);
                })),
          ),
          ToggleListItem(
            title: Text('I am the second item'),
            content: Padding(
              padding: EdgeInsets.all(20),
              child: Text('I am delighted that you are here.'),
            ),
          ),
          ToggleListItem(
            title: Text('I am the third item'),
            content: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Have a wonderful day!'),
            ),
          ),
        ],
      ),
    );
  }
}
