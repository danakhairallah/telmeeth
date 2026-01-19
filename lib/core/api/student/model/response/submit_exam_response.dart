class SubmitExamResponse {
  final bool status;
  final String message;

  SubmitExamResponse({
    required this.status,
    required this.message,
  });

  factory SubmitExamResponse.fromJson(Map<String, dynamic> json) {
    return SubmitExamResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? 'No response from server',
    );
  }
}
