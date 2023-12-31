import '../common/data/Time.dart';
import '../model/course/Course.dart';

class MockCourse {
  static final allCourseList = courseList1 + courseList2 + courseList3 + courseList4 + courseList5;

  static final courseList1 = [
    Course(
      id: 1,
      name: '基礎程式設計',
      description: "基礎程式設計課程",
      dayOfWeek: 2,
      startTime: Time(hour: 10, minute: 0),
      endTime: Time(hour: 12, minute: 0),
      instructorId: 7733,
    ),
    Course(
      id: 2,
      name: '人工智慧總整與實作',
      description: "人工智慧總整與實作課程",
      dayOfWeek: 4,
      startTime: Time(hour: 14, minute: 0),
      endTime: Time(hour: 16, minute: 0),
      instructorId: 7733,
    ),
    Course(
      id: 3,
      name: '訊號與系統',
      description: "訊號與系統課程",
      dayOfWeek: 5,
      startTime: Time(hour: 10, minute: 0),
      endTime: Time(hour: 12, minute: 0),
      instructorId: 7733,
    ),
  ];

  static final courseList2 = [
    Course(
      id: 4,
      name: 'C++實習',
      description: "C++實習課程",
      dayOfWeek: 3,
      startTime: Time(hour: 19, minute: 0),
      endTime: Time(hour: 21, minute: 0),
      instructorId: 234,
    ),
    Course(
      id: 5,
      name: '作業系統',
      description: "作業系統課程",
      dayOfWeek: 3,
      startTime: Time(hour: 8, minute: 0),
      endTime: Time(hour: 10, minute: 0),
      instructorId: 234,
    ),
  ];

  static final courseList3 = [
    Course(
      id: 6,
      name: '進階英文',
      description: "進階英文課程",
      dayOfWeek: 3,
      startTime: Time(hour: 15, minute: 30),
      endTime: Time(hour: 18, minute: 30),
      instructorId: 5,
    ),
  ];

  static final courseList4 = [
    Course(
      id: 7,
      name: '基礎程式設計',
      description: "基礎程式設計課程",
      dayOfWeek: 2,
      startTime: Time(hour: 9, minute: 0),
      endTime: Time(hour: 12, minute: 0),
      instructorId: 113,
    ),
    Course(
      id: 8,
      name: '進階程式設計',
      description: "進階程式設計課程",
      dayOfWeek: 4,
      startTime: Time(hour: 9, minute: 30),
      endTime: Time(hour: 12, minute: 30),
      instructorId: 113,
    ),
  ];

  static final courseList5 = [
    Course(
      id: 9,
      name: '動畫設計',
      description: "動畫設計課程",
      dayOfWeek: 1,
      startTime: Time(hour: 16, minute: 0),
      endTime: Time(hour: 18, minute: 0),
      instructorId: 666,
    ),
    Course(
      id: 10,
      name: '演算法',
      description: "演算法課程",
      dayOfWeek: 3,
      startTime: Time(hour: 11, minute: 0),
      endTime: Time(hour: 12, minute: 0),
      instructorId: 666,
    ),
    Course(
      id: 11,
      name: '進階程式設計',
      description: "進階程式設計課程",
      dayOfWeek: 1,
      startTime: Time(hour: 8, minute: 30),
      endTime: Time(hour: 13, minute: 30),
      instructorId: 666,
    ),
    Course(
      id: 12,
      name: 'C++實習',
      description: "C++實習課程",
      dayOfWeek: 4,
      startTime: Time(hour: 14, minute: 0),
      endTime: Time(hour: 16, minute: 0),
      instructorId: 666,
    ),
    Course(
      id: 13,
      name: '組合語言',
      description: "組合語言課程",
      dayOfWeek: 2,
      startTime: Time(hour: 15, minute: 0),
      endTime: Time(hour: 17, minute: 0),
      instructorId: 666,
    ),
  ];
}
