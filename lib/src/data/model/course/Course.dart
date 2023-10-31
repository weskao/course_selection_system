import '../../common/data/Time.dart';

class Course {
  final int id;
  final String name; // 課程名稱
  final String description; // 簡介
  final int dayOfWeek; // e.g., 1 for Monday, 2 for Tuesday, etc.
  final Time startTime;
  final Time endTime;

  static const int MIN_DAY_OF_WEEK = 1;
  static const int MAX_DAY_OF_WEEK = 7;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  }) : assert(dayOfWeek >= MIN_DAY_OF_WEEK && dayOfWeek <= MAX_DAY_OF_WEEK, 'dayOfWeek must be between 1 and 7');

  String getSchedule() {
    const daysOfWeekInChinese = {
      1: '一',
      2: '二',
      3: '三',
      4: '四',
      5: '五',
      6: '六',
      7: '日',
    };

    return '每周${daysOfWeekInChinese[dayOfWeek]}, ${startTime.toString()}-${endTime.toString()}';
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      dayOfWeek: json['dayOfWeek'],
      startTime: Time.fromJson(json['startTime']),
      endTime: Time.fromJson(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
    };
  }
}
