import '../model/course/BaseCourseDataSource.dart';
import '../model/course/Course.dart';
import '../model/course/Instructor.dart';

class CourseDataSource implements BaseCourseDataSource {
  final List<Course> allCourseList;
  final List<Instructor> instructorList;

  CourseDataSource({required this.allCourseList, required this.instructorList});

  @override
  List<Course> getAllCourses() => allCourseList;

  @override
  List<Instructor> getAllInstructors() => instructorList;

  @override
  void addCourse(Course course) => allCourseList.add(course);

  @override
  void addInstructor(Instructor instructor) => instructorList.add(instructor);

  @override
  void updateCourse(Course course) {
    final index = allCourseList.indexWhere((e) => e.id == course.id);
    if (index != -1) {
      allCourseList[index] = course;
    }
  }

  @override
  bool removeCourse(int courseId) {
    final initialLength = allCourseList.length;
    allCourseList.removeWhere((course) => course.id == courseId);
    return allCourseList.length < initialLength;
  }
}
