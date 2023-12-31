import '../model/course/Instructor.dart';
import 'MockCourse.dart';

class MockInstructor {
  static final List<Instructor> instructorList = [
    Instructor(
      id: 7733,
      name: "Albert Flores",
      rankLevel: 1,
      avatarUrl: 'assets/images/default_avatar/default_avatar_2.jpg',
      courseList: MockCourse.courseList1,
    ),
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
    Instructor(
      id: 113,
      name: "Jenny Wilson",
      rankLevel: 4,
      avatarUrl: 'assets/images/default_avatar/default_avatar_15.jpg',
      courseList: MockCourse.courseList4,
    ),
    Instructor(
      id: 666,
      name: "John Miles",
      rankLevel: 4,
      avatarUrl: 'assets/images/default_avatar/default_avatar_12.jpg',
      courseList: MockCourse.courseList5,
    ),
  ];
}
