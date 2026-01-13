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
      id: json['id'],
      report: json['response'] ?? '', // <-- عدلها من 'report' إلى 'response'
      createdAt: json['created_at'] ?? '',
    );
  }
}
