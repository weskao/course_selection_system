import 'package:course_selection_system/src/core/extensions/list_extension.dart';
import 'package:course_selection_system/src/core/service/CourseApiService.dart';
import 'package:course_selection_system/src/data/common/data/Time.dart';
import 'package:course_selection_system/src/data/mock/MockCourseDataSource.dart';
import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dataSource = MockCourseDataSource();
  late CourseApiService apiService;

  setUp(() {
    apiService = CourseApiService(dataSource);
  });

  group('getCourseList', () {
    test('should return all courses when instructorId is null', () {
      final result = apiService.getCourseList();
      final List<Course> allCourseList = [
        Course(
          id: 1,
          name: '基礎程式設計',
          description: "基礎程式設計課程",
          dayOfWeek: 2,
          startTime: Time(hour: 10, minute: 0),
          endTime: Time(hour: 12, minute: 0),
        ),
        Course(
          id: 2,
          name: '人工智慧總整與實作',
          description: "人工智慧總整與實作課程",
          dayOfWeek: 4,
          startTime: Time(hour: 14, minute: 0),
          endTime: Time(hour: 16, minute: 0),
        ),
        Course(
          id: 3,
          name: '訊號與系統',
          description: "訊號與系統課程",
          dayOfWeek: 5,
          startTime: Time(hour: 10, minute: 0),
          endTime: Time(hour: 12, minute: 0),
        ),
        Course(
          id: 4,
          name: 'C++實習',
          description: "C++實習課程",
          dayOfWeek: 3,
          startTime: Time(hour: 19, minute: 0),
          endTime: Time(hour: 21, minute: 0),
        ),
        Course(
          id: 5,
          name: '作業系統',
          description: "作業系統課程",
          dayOfWeek: 3,
          startTime: Time(hour: 8, minute: 0),
          endTime: Time(hour: 10, minute: 0),
        ),
        Course(
          id: 6,
          name: '進階英文',
          description: "進階英文課程",
          dayOfWeek: 3,
          startTime: Time(hour: 15, minute: 30),
          endTime: Time(hour: 18, minute: 30),
        ),
        Course(
          id: 7,
          name: '基礎程式設計',
          description: "基礎程式設計課程",
          dayOfWeek: 2,
          startTime: Time(hour: 9, minute: 0),
          endTime: Time(hour: 12, minute: 0),
        ),
        Course(
          id: 8,
          name: '進階程式設計',
          description: "進階程式設計課程",
          dayOfWeek: 4,
          startTime: Time(hour: 9, minute: 30),
          endTime: Time(hour: 12, minute: 30),
        ),
        Course(
          id: 9,
          name: '動畫設計',
          description: "動畫設計課程",
          dayOfWeek: 1,
          startTime: Time(hour: 16, minute: 0),
          endTime: Time(hour: 18, minute: 0),
        ),
        Course(
          id: 10,
          name: '演算法',
          description: "演算法課程",
          dayOfWeek: 3,
          startTime: Time(hour: 11, minute: 0),
          endTime: Time(hour: 12, minute: 0),
        ),
        Course(
          id: 11,
          name: '進階程式設計',
          description: "進階程式設計課程",
          dayOfWeek: 1,
          startTime: Time(hour: 8, minute: 30),
          endTime: Time(hour: 13, minute: 30),
        ),
        Course(
          id: 12,
          name: 'C++實習',
          description: "C++實習課程",
          dayOfWeek: 4,
          startTime: Time(hour: 14, minute: 0),
          endTime: Time(hour: 16, minute: 0),
        ),
        Course(
          id: 13,
          name: '組合語言',
          description: "組合語言課程",
          dayOfWeek: 2,
          startTime: Time(hour: 15, minute: 0),
          endTime: Time(hour: 17, minute: 0),
        ),
      ];

      expect(result.code, 200);
      expect(result.data.isEqualTo(allCourseList), isTrue);
    });
  });
}
