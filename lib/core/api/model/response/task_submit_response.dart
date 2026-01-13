class TaskSubmitResponse {
  String message;
  int totalMark;

  TaskSubmitResponse({required this.message, required this.totalMark});

  factory TaskSubmitResponse.fromJson(Map<String, dynamic> json) {
    return TaskSubmitResponse(
      message: json['message'],
      totalMark: json['total_mark'],
    );
  }
}
