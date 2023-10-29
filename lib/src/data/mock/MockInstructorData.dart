import 'package:course_selection_system/src/data/mock/MockCourseData.dart';

import '../model/course/Instructor.dart';

class MockInstructorData {
  static final List<Instructor> instructorList = [
    Instructor(
      name: "Albert Flores",
      rankLevel: 1,
      imageUrl: 'assets/images/default_avatar/default_avatar_2.jpg',
      courseList: MockCourseData.courseList1,
    ),
    Instructor(
      name: "Floyd Miles",
      rankLevel: 2,
      imageUrl: 'assets/images/default_avatar/default_avatar_5.jpg',
      courseList: MockCourseData.courseList2,
    ),
    Instructor(
      name: "Savannah Nguyen",
      rankLevel: 3,
      imageUrl: 'assets/images/default_avatar/default_avatar_8.jpg',
      courseList: MockCourseData.courseList3,
    ),
    Instructor(
      name: "Jenny Wilson",
      rankLevel: 4,
      imageUrl: 'assets/images/default_avatar/default_avatar_15.jpg',
      courseList: MockCourseData.courseList4,
    ),
    Instructor(
      name: "John Miles",
      rankLevel: 4,
      imageUrl: 'assets/images/default_avatar/default_avatar_12.jpg',
      courseList: MockCourseData.courseList5,
    ),
  ];
}
