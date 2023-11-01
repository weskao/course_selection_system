class Time {
  int hour;
  int minute;

  Time({
    required this.hour,
    required this.minute,
  });

  @override
  String toString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      hour: json['hour'],
      minute: json['minute'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is Time) {
      return hour == other.hour && minute == other.minute;
    }

    return false;
  }

  @override
  int get hashCode {
    return hour.hashCode ^ minute.hashCode;
  }
}
