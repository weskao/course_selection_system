import 'package:course_selection_system/src/data/model/course/Course.dart';

class CourseDetailData {
  final Course course;
  final String instructorName;

  CourseDetailData({
    required this.course,
    required this.instructorName,
  });
}
