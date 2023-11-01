import 'package:course_selection_system/src/core/extensions/list_extension.dart';
import 'package:course_selection_system/src/core/service/CourseApiService.dart';
import 'package:course_selection_system/src/data/common/data/Time.dart';
import 'package:course_selection_system/src/data/mock/CourseDataSource.dart';
import 'package:course_selection_system/src/data/mock/MockCourse.dart';
import 'package:course_selection_system/src/data/model/course/BaseCourseDataSource.dart';
import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:course_selection_system/src/data/model/course/Instructor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BaseCourseDataSource courseDataSource;
  late CourseApiService apiService;

  group('getCoursesByInstructorId', () {
    test('should return course list when instructorId exist', () {
      final allCourseList = [
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
      final instructorList = [
        Instructor(
          id: 234,
          name: "Floyd Miles",
          rankLevel: 2,
          avatarUrl: 'assets/images/default_avatar/default_avatar_5.jpg',
          courseList: MockCourse.courseList2,
        ),
        Instructor(
          id: 5,
          name: "Savannah Nguyen",
          rankLevel: 3,
          avatarUrl: 'assets/images/default_avatar/default_avatar_8.jpg',
          courseList: MockCourse.courseList3,
        ),
      ];

      courseDataSource = CourseDataSource(allCourseList: allCourseList, instructorList: instructorList);
      apiService = CourseApiService(courseDataSource);

      const existedInstructorId = 5;
      final result = apiService.getCoursesByInstructorId(existedInstructorId);

      final List<Course> expectedInstructorCourseList = [
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

    test('should return code 404 when instructorId not exist', () {
      final allCourseList = [
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
      final instructorList = [
        Instructor(
          id: 234,
          name: "Floyd Miles",
          rankLevel: 2,
          avatarUrl: 'assets/images/default_avatar/default_avatar_5.jpg',
          courseList: MockCourse.courseList2,
        ),
        Instructor(
          id: 5,
          name: "Savannah Nguyen",
          rankLevel: 3,
          avatarUrl: 'assets/images/default_avatar/default_avatar_8.jpg',
          courseList: MockCourse.courseList3,
        ),
      ];

      courseDataSource = CourseDataSource(allCourseList: allCourseList, instructorList: instructorList);
      apiService = CourseApiService(courseDataSource);

      const notExistedInstructorId = 0;
      final result = apiService.getCoursesByInstructorId(notExistedInstructorId);

      final List<Course> expectedInstructorCourseList = [];

      expect(result.code, 404);
      expect(result.data.isEqualTo(expectedInstructorCourseList), isTrue);
    });
  });
}
