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

  group('getCoursesByInstructorId', () {
    test('should return course list when instructorId exist', () {
      const existedInstructorId = 5;
      final result = apiService.getCoursesByInstructorId(existedInstructorId);
      final List<Course> allCourseList = [
        Course(
          id: 6,
          name: '進階英文',
          description: "進階英文課程",
          dayOfWeek: 3,
          startTime: Time(hour: 15, minute: 30),
          endTime: Time(hour: 18, minute: 30),
          instructorId: 5,
        ),
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

      final expectedInstructorCourseList = [
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

      expect(result.code, 200);
      expect(result.data.isEqualTo(expectedInstructorCourseList), isTrue);
    });
  });
}
