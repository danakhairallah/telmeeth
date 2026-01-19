class StudyPlanModel {
  final int id;
  final int studentId;
  final String title;
  final String startDate;
  final String endDate;
  final String aiResponse;
  final String createdAt;
  final String updatedAt;

  StudyPlanModel({
    required this.id,
    required this.studentId,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.aiResponse,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudyPlanModel.fromJson(Map<String, dynamic> json) {
    return StudyPlanModel(
      id: json['id'],
      studentId: json['student_id'],
      title: json['title'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      aiResponse: json['ai_response'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
