import '../../../presentation/utils/InstructorUtils.dart';
import 'Course.dart';
import 'enum/InstructorRank.dart';

class Instructor {
  final String name;
  final int rankLevel;
  final String avatarUrl;
  final List<Course> courseList;

  Instructor({
    required this.name,
    required this.rankLevel,
    required this.avatarUrl,
    required this.courseList,
  });

  InstructorRank get rank => InstructorUtils.intToInstructorRank(rankLevel);
  String get rankName => InstructorUtils.getInstructorRankExplanation(rank);

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      name: json['name'],
      rankLevel: json['rankLevel'],
      avatarUrl: json['avatarUrl'],
      courseList: (json['courseList'] as List).map((e) => Course.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rankLevel': rankLevel,
      'avatarUrl': avatarUrl,
      'courseList': courseList.map((course) => course.toJson()).toList(),
    };
  }

  Instructor copyWith({
    String? name,
    int? rankLevel,
    String? avatarUrl,
    List<Course>? courseList,
  }) {
    return Instructor(
      name: name ?? this.name,
      rankLevel: rankLevel ?? this.rankLevel,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      courseList: courseList ?? this.courseList,
    );
  }
}
