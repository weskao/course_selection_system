import 'package:flutter/material.dart';

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
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        itemPadding: const EdgeInsets.all(10),
        trailing: const Icon(Icons.add),
        // trailing: const Icon(Icons.minimize),
        children: [
          ToggleListItem(
            title: Text('I am the first item'),
            content: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    // height: 30,
                    color: Colors.yellow,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.calendar_month,
                            size: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '基礎程式設計',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "每周二 10:00-12:00",
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
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
