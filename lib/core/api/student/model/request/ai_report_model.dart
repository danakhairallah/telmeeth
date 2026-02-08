class AiReportModel {
  final int id;
  final String report;
  final String createdAt;

  AiReportModel({
    required this.id,
    required this.report,
    required this.createdAt,
  });

  factory AiReportModel.fromJson(Map<String, dynamic> json) {
    return AiReportModel(
      id: json['id'], // ⭐ هذا المهم
      report: json['report'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
