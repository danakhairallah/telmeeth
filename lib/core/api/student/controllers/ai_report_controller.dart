import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/ai_report_model.dart';
import 'package:telmeeth/core/api/student/model/request/report_request.dart';
import 'package:telmeeth/core/api/student/model/response/report_respons.dart';
import 'package:telmeeth/core/api/student/services/ai_report_service.dart';

class AiReportController with ChangeNotifier {
  final AiReportService _service = AiReportService();

  /// Loading
  bool isLoading = false;

  /// Generate report response
  AiReportResponse? reportResponse;

  /// AI Reports list
  List<AiReportModel> reports = [];

  // ================== GENERATE REPORT ==================
  Future<void> generateReport(AiReportRequest request) async {
    isLoading = true;
    notifyListeners();

    try {
      reportResponse = await _service.generateReport(request);
    } catch (e) {
      debugPrint('Generate report error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearReport() {
    reportResponse = null;
    notifyListeners();
  }

  // ================== FETCH REPORTS ==================
  Future<void> fetchReports() async {
    isLoading = true;
    notifyListeners();

    try {
      reports = await _service.getAiReports();
    } catch (e) {
      debugPrint('Fetch AI reports error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================== DELETE REPORT ==================
// =========== DELETE REPORT ===========
  Future<bool> deleteReport(int id) async {
    try {
      final success = await _service.deleteReport(id);
      if (success) {
        // احذف العنصر مباشرة من القائمة المحلية
        reports.removeWhere((r) => r.id == id);
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Delete report error: $e');
      return false;
    }
  }
}
