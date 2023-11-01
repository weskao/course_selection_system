import 'Course.dart';
import 'Instructor.dart';

abstract class CourseDataSource {
  List<Course> getAllCourses();
  List<Instructor> getAllInstructors();
  void addCourse(Course course);
  void addInstructor(Instructor instructor);
  void updateCourse(Course course);
  bool removeCourse(int courseId);
}
