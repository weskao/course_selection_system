class DataApiResult<T> {
  final T data;
  final int code;

  DataApiResult({
    required this.data,
    required this.code,
  });

  factory DataApiResult.fromJson(Map<String, dynamic> json) {
    return DataApiResult(
      data: json['data'],
      code: json['code'] as int,
    );
  }
}
