import 'package:course_selection_system/src/core/service/CourseApiService.dart';
import 'package:course_selection_system/src/data/common/data/Time.dart';
import 'package:course_selection_system/src/data/mock/MockCourseData.dart';
import 'package:course_selection_system/src/data/mock/MockInstructorData.dart';
import 'package:course_selection_system/src/data/model/course/Course.dart';
import 'package:course_selection_system/src/data/model/course/Instructor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final CourseApiService service = CourseApiService();

  Instructor mockInstructor = Instructor(id: 999, name: 'Mock Instructor', rankLevel: 1, avatarUrl: 'mockAvatarUrl', courseList: []);

  Course mockCourse = Course(
    id: 999,
    name: 'Mock Course',
    description: 'Test description',
    dayOfWeek: 1,
    startTime: Time(hour: 10, minute: 0),
    endTime: Time(hour: 12, minute: 0),
  );

  setUp(() {
    // Add mock instructor and course for tests
    MockInstructorData.instructorList.add(mockInstructor);
    MockCourseData.allCourseList.add(mockCourse);
  });

  tearDown(() {
    // Clean up mock data after each test
    MockInstructorData.instructorList.removeWhere((i) => i.id == mockInstructor.id);
    MockCourseData.allCourseList.removeWhere((c) => c.id == mockCourse.id);
  });

  test('testGetInstructorList', () {
    var result = service.getInstructorList();
    expect(result.code, 200);
    expect(result.data, isNotEmpty);
  });

  test('testGetCourseListForValidInstructor', () {
    var result = service.getCourseList(mockInstructor.id);
    expect(result.code, 200);
    expect(result.data, contains(mockCourse));
  });

  test('testGetCourseListForInvalidInstructor', () {
    var result = service.getCourseList(123456); // A non-existing instructor id
    expect(result.code, 404);
    expect(result.data, isEmpty);
  });

  test('testCreateInstructor', () {
    Instructor newInstructor = Instructor(id: 1000, name: 'New Instructor', rankLevel: 2, avatarUrl: 'newAvatarUrl', courseList: []);
    var result = service.createInstructor(newInstructor);
    expect(result.code, 201);
    expect(result.data, equals(newInstructor));
    MockInstructorData.instructorList.removeWhere((i) => i.id == newInstructor.id); // Clean up
  });

  test('testCreateCourse', () {
    Course newCourse = Course(
        id: 1000, name: 'New Course', description: 'Test', dayOfWeek: 2, startTime: Time(hour: 10, minute: 0), endTime: Time(hour: 11, minute: 0));
    var result = service.createCourse(newCourse);
    expect(result.code, 201);
    expect(result.data.data.name, equals(newCourse.name));
    MockCourseData.allCourseList.removeWhere((c) => c.id == 1000); // Clean up
  });

  test('testUpdateExistingCourse', () {
    Course toUpdatedCourse = Course(
      id: 999,
      name: 'Updated Mock Course',
      description: 'Test description',
      dayOfWeek: 1,
      startTime: Time(hour: 10, minute: 0),
      endTime: Time(hour: 12, minute: 0),
    );

    var result = service.updateCourse(toUpdatedCourse);
    expect(result.code, 200);
    expect(result.data.name, equals('Updated Mock Course'));
  });

  test('testUpdateNonExistingCourse', () {
    var result = service.updateCourse(Course(
        id: 123456,
        name: 'Non-Existing Course',
        description: 'Test',
        dayOfWeek: 2,
        startTime: Time(hour: 10, minute: 0),
        endTime: Time(hour: 11, minute: 0)));
    expect(result.code, 404);
  });

  test('testDeleteExistingCourse', () {
    var result = service.deleteCourse(mockCourse.id);

    expect(result.code, 200);
    expect(result.data, isTrue);
  });

  test('testDeleteNonExistingCourse', () {
    var result = service.deleteCourse(123456); // A non-existing course id
    expect(result.code, 404);
    expect(result.data, isFalse);
  });
}
