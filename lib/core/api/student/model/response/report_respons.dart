class AiReportResponse {
  final String message;
  final String report;

  AiReportResponse({
    required this.message,
    required this.report,
  });

  factory AiReportResponse.fromJson(Map<String, dynamic> json) {
    return AiReportResponse(
      message: json['message'] ?? '',
      report: json['report'] ?? '',
    );
  }
}
