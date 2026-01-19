class AiAdviceData {
  final int? id;
  final int? studentId;
  final String content;
  final String? createdAt;
  final String? updatedAt;

  AiAdviceData({
    this.id,
    this.studentId,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory AiAdviceData.fromJson(Map<String, dynamic> json) {
    return AiAdviceData(
      id: json['id'],
      studentId: json['student_id'],
      content: json['ar'] ?? json['advice'] ?? json['content'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
