import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/ai_report_model.dart';
import 'package:telmeeth/core/api/student/model/request/report_request.dart';
import 'package:telmeeth/core/api/student/model/response/report_respons.dart';


class AiReportService {

  /// POST – Generate AI Report
  Future<AiReportResponse?> generateReport(AiReportRequest request) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.post(
        '/student/report',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return AiReportResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      debugPrint('Generate Report Error: $e');
      return null;
    }
  }

  /// GET – List AI Reports
  Future<List<AiReportModel>> getAiReports() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get('/student/AI-reports');

      final List list = response.data is List ? response.data : [];
      return list.map((e) => AiReportModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Get Reports Error: $e');
      return [];
    }
  }

  /// DELETE – Delete AI Report
  Future<bool> deleteReport(int reportId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.delete(
        '/student/report/$reportId',
      );

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Delete Report Error: $e');
      return false;
    }
  }
}
