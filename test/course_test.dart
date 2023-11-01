import 'package:course_selection_system/src/core/service/CourseApiService.dart';
import 'package:course_selection_system/src/data/mock/MockCourseDataSource.dart';
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
      expect(result.code, 200);
      expect(result.data, MockCourseDataSource.allCourseList);
    });

    // test('should return courses by instructor when valid instructorId is provided', () {
    //   const instructorId = 1; // Assume this is a valid instructor ID
    //   final instructor = MockInstructorData.instructorList.firstWhere((i) => i.id == instructorId);
    //
    //   final result = apiService.getCourseList(instructorId: instructorId);
    //   expect(result.code, 200);
    //   expect(result.data, instructor.courseList);
    // });
    //
    // test('should return empty list and 404 when invalid instructorId is provided', () {
    //   final result = apiService.getCourseList(instructorId: 9999); // Assume this is an invalid instructor ID
    //   expect(result.code, 404);
    //   expect(result.data, []);
    // });
  });
}
