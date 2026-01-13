class StudyPlanResponse {
  final String message;
  final int planId;
  final String aiResponse;

  StudyPlanResponse({
    required this.message,
    required this.planId,
    required this.aiResponse,
  });

  factory StudyPlanResponse.fromJson(Map<String, dynamic> json) {
    return StudyPlanResponse(
      message: json['message'] ?? '',
      planId: json['plan_id'],
      aiResponse: json['ai_response'] ?? '',
    );
  }
}
