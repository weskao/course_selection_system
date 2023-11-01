import 'package:course_selection_system/src/data/model/course/enum/InstructorRank.dart';

class InstructorUtils {
  static const int MIN_INSTRUCTOR_RANK_ENUM_VALUE = 0;
  static const String UNKNOWN_EXPLANATION = "未知";

  static const Map<InstructorRank, String> instructorRankExplanationMap = {
    InstructorRank.unknown: UNKNOWN_EXPLANATION,
    InstructorRank.demonstrator: "Demonstrator",
    InstructorRank.lecturer: "Lecturer",
    InstructorRank.seniorLecturer: "Senior Lecturer",
    InstructorRank.professor: "Professor",
  };

  static InstructorRank intToInstructorRank(int toConvertInt) {
    if (toConvertInt >= MIN_INSTRUCTOR_RANK_ENUM_VALUE && toConvertInt < InstructorRank.values.length) {
      return InstructorRank.values[toConvertInt];
    } else {
      throw Exception('[InstructorUtils] intToInstructorRank() - Invalid InstructorRank int value: $toConvertInt');
    }
  }

  static String getInstructorRankExplanation(InstructorRank type) {
    return instructorRankExplanationMap[type] ?? UNKNOWN_EXPLANATION;
  }
}
