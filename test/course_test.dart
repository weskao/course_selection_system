import 'package:course_selection_system/src/core/extensions/list_extension.dart';
import 'package:course_selection_system/src/core/service/CourseApiService.dart';
import 'package:course_selection_system/src/data/common/api/DataApiResult.dart';
import 'package:course_selection_system/src/data/common/data/Time.dart';
import 'package:course_selection_system/src/data/mock/CourseDataSource.dart';
import 'package:course_selection_system/src/data/mock/MockCourse.dart';
import 'package:course_selection_system/src/data/model/course/BaseCourseDataSource.dart';
import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:course_selection_system/src/data/model/course/Instructor.dart';
import 'package:flutter_test/flutter_test.dart';

late BaseCourseDataSource courseDataSource;
late CourseApiService apiService;
late DataApiResult<List<Course>> courseListResult;
late DataApiResult<bool> boolResult;

void main() {
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
      const existedInstructorId = 5;
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

      givenCourseDataSource(allCourseList, instructorList);
      initApiService(courseDataSource);
      requestGetCoursesByInstructorIdApi(existedInstructorId);
      expectedCourseResultShouldBe(courseListResult, 200, expectedInstructorCourseList);
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
      const notExistedInstructorId = 0;
      final List<Course> expectedInstructorCourseList = [];

      givenCourseDataSource(allCourseList, instructorList);
      initApiService(courseDataSource);
      requestGetCoursesByInstructorIdApi(notExistedInstructorId);
      expectedCourseResultShouldBe(courseListResult, 404, expectedInstructorCourseList);
    });

    test('should return code 200 and empty list when instructor has No any courses', () {
      final allCourseList = [
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
          courseList: [],
        ),
      ];

      const existedInstructorId = 5;
      final List<Course> expectedInstructorCourseList = [];

      givenCourseDataSource(allCourseList, instructorList);
      initApiService(courseDataSource);
      requestGetCoursesByInstructorIdApi(existedInstructorId);
      expectedCourseResultShouldBe(courseListResult, 200, expectedInstructorCourseList);
    });
  });

  group('updateCourse', () {
    test('should return 200 and update target course data when course id exist', () {
      const existedCourseId = 6;

      final allCourseList = [
        Course(
          id: existedCourseId,
          name: '進階英文',
          description: "進階英文課程",
          dayOfWeek: 3,
          startTime: Time(hour: 15, minute: 30),
          endTime: Time(hour: 18, minute: 30),
          instructorId: 5,
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

      final Course toUpdatedCourse = Course(
        id: existedCourseId,
        name: '進階英文2',
        description: "進階英文課程2",
        dayOfWeek: 2,
        startTime: Time(hour: 12, minute: 0),
        endTime: Time(hour: 14, minute: 0),
        instructorId: 5,
      );

      final List<Course> expectedAllCourseList = [
        toUpdatedCourse,
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

      givenCourseDataSource(allCourseList, instructorList);
      initApiService(courseDataSource);
      requestUpdateCourse(toUpdatedCourse);
      expectedBoolResultShouldBe(boolResult, 200, isTrue);
      requestGetAllCourses();
      expectedCourseResultShouldBe(courseListResult, 200, expectedAllCourseList);
    });

    test('should return 404 and remain original course list data when to update course id not exist', () {
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
      const notExistedCourseId = 999;

      final Course nonExistentCourseToUpdate = Course(
        id: notExistedCourseId, // Some non-existent course ID.
        name: '不存在的課程', // Name for the non-existent course.
        description: "描述",
        dayOfWeek: 1,
        startTime: Time(hour: 9, minute: 0),
        endTime: Time(hour: 11, minute: 0),
        instructorId: 5,
      );

      final List<Course> expectedAllCourseList = [
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
          id: 3,
          name: '訊號與系統',
          description: "訊號與系統課程",
          dayOfWeek: 5,
          startTime: Time(hour: 10, minute: 0),
          endTime: Time(hour: 12, minute: 0),
          instructorId: 7733,
        ),
      ];

      givenCourseDataSource(allCourseList, instructorList);
      initApiService(courseDataSource);
      requestUpdateCourse(nonExistentCourseToUpdate);
      expectedBoolResultShouldBe(boolResult, 404, isFalse);
      requestGetAllCourses();
      expectedCourseResultShouldBe(courseListResult, 200, expectedAllCourseList);
    });
  });

  group('deleteCourse', () {
    test('should return 200 and delete target course data when wanted to deleted course id exist', () {
      const existedCourseId = 6;
      const int toDeletedCourseId = existedCourseId;

      final allCourseList = [
        Course(
          id: existedCourseId,
          name: '進階英文',
          description: "進階英文課程",
          dayOfWeek: 3,
          startTime: Time(hour: 15, minute: 30),
          endTime: Time(hour: 18, minute: 30),
          instructorId: 5,
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

      final List<Course> expectedAllCourseList = [
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

      givenCourseDataSource(allCourseList, instructorList);
      initApiService(courseDataSource);
      requestDeleteCourse(toDeletedCourseId);
      expectedBoolResultShouldBe(boolResult, 200, isTrue);
      requestGetAllCourses();
      expectedCourseResultShouldBe(courseListResult, 200, expectedAllCourseList);
    });

    test('should return 404 and remain original course list data when to delete course id not exist', () {
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
      const notExistedCourseId = 777;

      final List<Course> expectedAllCourseList = [
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
          id: 3,
          name: '訊號與系統',
          description: "訊號與系統課程",
          dayOfWeek: 5,
          startTime: Time(hour: 10, minute: 0),
          endTime: Time(hour: 12, minute: 0),
          instructorId: 7733,
        ),
      ];

      givenCourseDataSource(allCourseList, instructorList);
      initApiService(courseDataSource);
      requestDeleteCourse(notExistedCourseId);
      expectedBoolResultShouldBe(boolResult, 404, isFalse);
      requestGetAllCourses();
      expectedCourseResultShouldBe(courseListResult, 200, expectedAllCourseList);
    });
  });
}

void requestUpdateCourse(Course toUpdatedCourse) {
  boolResult = apiService.updateCourse(toUpdatedCourse);
}

void requestDeleteCourse(int courseId) {
  boolResult = apiService.deleteCourse(courseId);
}

void requestGetCoursesByInstructorIdApi(int instructorId) {
  courseListResult = apiService.getCoursesByInstructorId(instructorId);
}

void requestGetAllCourses() {
  courseListResult = apiService.getCourseList();
}

void expectedCourseResultShouldBe(DataApiResult<List<Course>> result, int expectedCode, List<Course> expectedInstructorCourseList,
    {Matcher? matcher = isTrue}) {
  expect(result.code, expectedCode);
  expect(result.data.isEqualTo(expectedInstructorCourseList), matcher);
}

void expectedBoolResultShouldBe(DataApiResult<bool> boolResult, int expectedCode, Matcher matcher) {
  expect(boolResult.code, expectedCode);
  expect(boolResult.data, matcher);
}

void givenCourseDataSource(List<Course> allCourseList, List<Instructor> instructorList) {
  courseDataSource = CourseDataSource(allCourseList: allCourseList, instructorList: instructorList);
}

void initApiService(BaseCourseDataSource courseDataSource) {
  apiService = CourseApiService(courseDataSource);
}
