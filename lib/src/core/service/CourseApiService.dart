import 'dart:io';

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
    var instructor = MockInstructorData.instructorList.firstWhereOrNull((instructor) => instructor.id == instructorId);

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
  DataApiResult<Instructor> createInstructor(Instructor instructor) {
    MockInstructorData.instructorList.add(instructor);
    return DataApiResult<Instructor>(
      data: instructor,
      code: 201,
    );
  }

  int get _nextId {
    if (MockCourseData.allCourseList.isEmpty) return 1;
    return MockCourseData.allCourseList.map((course) => course.id).reduce((value, element) => value > element ? value : element) + 1;
  }

  // 建立新課程 API (Create)
  DataApiResult createCourse(Course course) {
    Course newCourse = Course(
      id: _nextId,
      name: course.name,
      description: course.description,
      dayOfWeek: course.dayOfWeek,
      startTime: course.startTime,
      endTime: course.endTime,
    );

    DataApiResult<Course> response = DataApiResult(
      data: newCourse,
      code: 201,
    );

    if (response.code == HttpStatus.ok || response.code == HttpStatus.created) {
      MockCourseData.allCourseList.add(newCourse);
    }

    return response;
  }

  // 更新課程內容 API (Update)
  DataApiResult<Course> updateCourse(Course updatedCourse) {
    final toFindCourse = MockCourseData.allCourseList.firstWhereOrNull((e) => e.id == updatedCourse.id);
    if (toFindCourse != null) {
      return DataApiResult<Course>(
        data: updatedCourse,
        code: 200,
      );
    } else {
      return DataApiResult<Course>(
        data: updatedCourse,
        code: 404,
      );
    }
  }

  // 刪除課程 API (Delete)
  DataApiResult<bool> deleteCourse(int courseId) {
    int initialLength = MockCourseData.allCourseList.length;

    MockCourseData.allCourseList.removeWhere((course) => course.id == courseId);

    bool wasRemoved = MockCourseData.allCourseList.length < initialLength;

    return DataApiResult<bool>(
      data: wasRemoved,
      code: wasRemoved ? 200 : 404,
    );
  }
}
