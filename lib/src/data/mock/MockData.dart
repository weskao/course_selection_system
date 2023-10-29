import '../common/data/Time.dart';
import '../model/course/Course.dart';
import '../model/course/Instructor.dart';

class MockData {
  static final List<Course> courseList = [
    Course(
      name: '基礎程式設計',
      description: "基礎程式設計課程",
      dayOfWeek: 2,
      startTime: Time(hour: 10, minute: 0),
      endTime: Time(hour: 12, minute: 0),
      instructor: "Albert Flores",
    ),
    Course(
      name: '人工智慧總整與實作',
      description: "人工智慧總整與實作課程",
      dayOfWeek: 4,
      startTime: Time(hour: 14, minute: 0),
      endTime: Time(hour: 16, minute: 0),
      instructor: "Albert Flores",
    ),
    Course(
      name: '訊號與系統',
      description: "訊號與系統課程",
      dayOfWeek: 5,
      startTime: Time(hour: 10, minute: 0),
      endTime: Time(hour: 12, minute: 0),
      instructor: "Albert Flores",
    ),
  ];

  static final List<Instructor> instructorList = [
    Instructor(
      name: "Albert Flores",
      rankLevel: 1,
      imageUrl: 'assets/images/default_avatar/default_avatar_2.jpg',
      courseList: courseList,
    )
  ];
}
