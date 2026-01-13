import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/request/worksheet_request.dart';
import 'package:telmeeth/core/api/model/response/worksheet_data.dart';
import 'package:telmeeth/core/api/student/services/worksheet_services.dart';

class WorksheetController extends ChangeNotifier {
  final WorksheetServices _service = WorksheetServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<WorksheetData>? _worksheets;
  List<WorksheetData>? get worksheets => _worksheets;

  WorksheetData? _selectedWorksheet;
  WorksheetData? get selectedWorksheet => _selectedWorksheet;

  /// ===== جلب كل الـ Worksheets =====
  Future<void> getWorksheets() async {
    _isLoading = true;
    notifyListeners();

    try {
      _worksheets = await _service.getWorksheets();
    } catch (e) {
      print("Controller getWorksheets error: $e");
      _worksheets = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// ===== جلب Worksheet حسب ID =====
  Future<void> getWorksheetById(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedWorksheet = await _service.getWorksheetById(id);
    } catch (e) {
      print("Controller getWorksheetById error: $e");
      _selectedWorksheet = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// ===== إرسال الإجابات =====
  Future<bool> submitWorksheet(int worksheetId, WorksheetSubmitRequest request) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _service.submitWorksheet(worksheetId, request);
      return result;
    } catch (e) {
      print("Controller submitWorksheet error: $e");
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// ===== إعادة تعيين الورقة المحددة =====
  void clearSelectedWorksheet() {
    _selectedWorksheet = null;
    notifyListeners();
  }
}
