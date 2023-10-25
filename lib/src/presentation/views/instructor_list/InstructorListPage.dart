import 'package:course_selection_system/generated/assets.gen.dart';
import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:course_selection_system/src/presentation/views/instructor_list/widget/CourseListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/PrimaryPage.dart';
import '../../widgets/toggle_list/toggle_list.dart';

class InstructorListPage extends StatelessWidget {
  const InstructorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final course = Course(name: '基礎程式設計', description: "基礎程式設計課程", schedule: "每周二 10:00-12:00", instructor: "Albert Flores");
    final courseList = [
      Course(name: '基礎程式設計', description: "基礎程式設計課程", schedule: "每周二, 10:00-12:00", instructor: "Albert Flores"),
      Course(name: '人工智慧總整與實作', description: "人工智慧總整與實作課程", schedule: "每周四, 14:00-16:00", instructor: "Albert Flores"),
      Course(name: '訊號與系統', description: "訊號與系統課程", schedule: "每周五, 10:00-12:00", instructor: "Albert Flores"),
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
                  child: Assets.images.defaultAvatar.defaultAvatar1.image(width: 40.r, height: 40.r),
                ),
                SizedBox(width: 10.r),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Demonstrator",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color.fromRGBO(163, 163, 163, 1),
                      ),
                    ),
                    SizedBox(height: 5.r),
                    Text(
                      course.instructor,
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
