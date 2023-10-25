class Course {
  String name; // 課程名稱
  String description; // 簡介
  String schedule; // 上課時間，例如：每周二 10:00-12:00
  String instructor; // 授課講師

  Course({
    required this.name,
    required this.description,
    required this.schedule,
    required this.instructor,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'],
      description: json['description'],
      schedule: json['schedule'],
      instructor: json['instructor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'schedule': schedule,
      'instructor': instructor,
    };
  }
}
