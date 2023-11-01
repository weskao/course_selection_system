import 'package:collection/collection.dart';

import '../../data/common/api/DataApiResult.dart';
import '../../data/model/course/Course.dart';
import '../../data/model/course/CourseDataSource.dart';
import '../../data/model/course/Instructor.dart';

class CourseApiService {
  final CourseDataSource _dataSource;

  CourseApiService(this._dataSource);

  // 課程列表 API (Read)
  DataApiResult<List<Course>> getCourseList({int? instructorId}) {
    if (instructorId == null) {
      return DataApiResult<List<Course>>(
        data: _dataSource.getAllCourses(),
        code: 200,
      );
    }

    Instructor? instructor = _dataSource.getAllInstructors().firstWhereOrNull((instructor) => instructor.id == instructorId);

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
      data: _dataSource.getAllInstructors(),
      code: 200,
    );
  }

  // 授課講師所開課程列表 API (Read)
  DataApiResult<List<Course>> getCoursesByInstructorId(int instructorId) {
    final instructor = _dataSource.getAllInstructors().firstWhereOrNull((instructor) => instructor.id == instructorId);

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
    final existingInstructor = _dataSource.getAllInstructors().firstWhereOrNull((e) => e.id == instructor.id);

    if (existingInstructor != null) {
      return DataApiResult<bool>(
        data: false,
        code: 409,
      );
    }

    _dataSource.getAllInstructors().add(instructor);
    return DataApiResult<bool>(
      data: true,
      code: 201,
    );
  }

  int get _nextId {
    if (_dataSource.getAllCourses().isEmpty) return 1;
    return _dataSource.getAllCourses().map((course) => course.id).reduce((value, element) => value > element ? value : element) + 1;
  }

  // 建立新課程 API (Create)
  DataApiResult<bool> createCourse(Course course) {
    final existingCourse = _dataSource.getAllCourses().firstWhereOrNull((e) => e.id == course.id);

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

    _dataSource.getAllCourses().add(newCourse);
    return DataApiResult<bool>(
      data: true,
      code: 201,
    );
  }

  // 更新課程內容 API (Update)
  DataApiResult<bool> updateCourse(Course updatedCourse) {
    final int index = _dataSource.getAllCourses().indexWhere((e) => e.id == updatedCourse.id);
    final bool isCourseExist = index != -1;

    if (isCourseExist) {
      _dataSource.getAllCourses()[index] = updatedCourse;
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
    final int initialLength = _dataSource.getAllCourses().length;

    _dataSource.getAllCourses().removeWhere((course) => course.id == courseId);

    final bool wasRemoved = _dataSource.getAllCourses().length < initialLength;

    return DataApiResult<bool>(
      data: wasRemoved,
      code: wasRemoved ? 200 : 404,
    );
  }
}
