import 'package:course_selection_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/PrimaryPage.dart';
import '../../widgets/toggle_list/toggle_list.dart';

class InstructorListPage extends StatelessWidget {
  const InstructorListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        // trailing: const Icon(Icons.minimize),
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
                      "Albert Flores",
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
              children: [
                Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.symmetric(vertical: 5.r),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 2.r, right: 10.r),
                        child: Icon(
                          Icons.calendar_month,
                          size: 20.r,
                          color: Color.fromRGBO(140, 140, 140, 1),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '基礎程式設計',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            "每周二 10:00-12:00",
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
                Text('Hello there-2!'),
                Text('Hello there-3!'),
              ],
            ),
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
