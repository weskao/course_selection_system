import 'package:collection/collection.dart';
import 'package:course_selection_system/src/data/mock/MockCourseData.dart';

import '../../data/common/api/DataApiResult.dart';
import '../../data/mock/MockInstructorData.dart';
import '../../data/model/course/Course.dart';
import '../../data/model/course/Instructor.dart';

class CourseApiService {
  // 課程列表 API (Read)
  DataApiResult<List<Course>> getCourseList(int? instructorId) {
    if (instructorId == null) {
      return DataApiResult<List<Course>>(
        data: MockCourseData.allCourseList,
        code: 200,
      );
    }

    Instructor? instructor = MockInstructorData.instructorList.firstWhereOrNull((instructor) => instructor.id == instructorId);

    if (instructor == null) {
      return DataApiResult<List<Course>>(
        data: [],
        code: 404,
      );
    }

    return DataApiResult<List<Course>>(
      data: instructor.courseList,
      code: 200,
    );
  }

  // 授課講師列表 API (Read)
  DataApiResult<List<Instructor>> getInstructorList() {
    return DataApiResult<List<Instructor>>(
      data: MockInstructorData.instructorList,
      code: 200,
    );
  }

  // 授課講師所開課程列表 API (Read)
  DataApiResult<List<Course>> getCoursesByInstructorId(int instructorId) {
    final instructor = MockInstructorData.instructorList.firstWhereOrNull((instructor) => instructor.id == instructorId);

    if (instructor == null) {
      return DataApiResult<List<Course>>(
        data: [],
        code: 404,
      );
    }

    return DataApiResult<List<Course>>(
      data: instructor.courseList,
      code: 200,
    );
  }

// 建立新講師 API (Create)
  DataApiResult<bool> createInstructor(Instructor instructor) {
    final existingInstructor = MockInstructorData.instructorList.firstWhereOrNull((e) => e.id == instructor.id);

    if (existingInstructor != null) {
      return DataApiResult<bool>(
        data: false,
        code: 409,
      );
    }

    MockInstructorData.instructorList.add(instructor);
    return DataApiResult<bool>(
      data: true,
      code: 201,
    );
  }

  int get _nextId {
    if (MockCourseData.allCourseList.isEmpty) return 1;
    return MockCourseData.allCourseList.map((course) => course.id).reduce((value, element) => value > element ? value : element) + 1;
  }

  // 建立新課程 API (Create)
  DataApiResult<bool> createCourse(Course course) {
    final existingCourse = MockCourseData.allCourseList.firstWhereOrNull((e) => e.id == course.id);

    if (existingCourse != null) {
      return DataApiResult<bool>(
        data: false,
        code: 409,
      );
    }

    Course newCourse = Course(
      id: _nextId,
      name: course.name,
      description: course.description,
      dayOfWeek: course.dayOfWeek,
      startTime: course.startTime,
      endTime: course.endTime,
    );

    MockCourseData.allCourseList.add(newCourse);
    return DataApiResult<bool>(
      data: true,
      code: 201,
    );
  }

  // 更新課程內容 API (Update)
  DataApiResult<bool> updateCourse(Course updatedCourse) {
    final int index = MockCourseData.allCourseList.indexWhere((e) => e.id == updatedCourse.id);
    final bool isCourseExist = index != -1;

    if (isCourseExist) {
      MockCourseData.allCourseList[index] = updatedCourse;
      return DataApiResult<bool>(
        data: true,
        code: 200,
      );
    } else {
      return DataApiResult<bool>(
        data: false,
        code: 404,
      );
    }
  }

  // 刪除課程 API (Delete)
  DataApiResult<bool> deleteCourse(int courseId) {
    final int initialLength = MockCourseData.allCourseList.length;

    MockCourseData.allCourseList.removeWhere((course) => course.id == courseId);

    final bool wasRemoved = MockCourseData.allCourseList.length < initialLength;

    return DataApiResult<bool>(
      data: wasRemoved,
      code: wasRemoved ? 200 : 404,
    );
  }
}
