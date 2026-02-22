import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/worksheet_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/worksheet_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/worksheet_teacher_service.dart';

class WorksheetTeacherController extends ChangeNotifier {
  final WorksheetTeacherService _service = WorksheetTeacherService();

  bool isLoading = false;

  WorksheetTeacherModel? worksheets;
  WorksheetTeacherDetailes? worksheetDetails;
  WorksheetTeacherPost? addedWorksheet;
  WorksheetTeacherUpdate? updatedWorksheet;
  WorksheetTeacherDelete? deletedWorksheet;

  /// جلب جميع worksheets
  Future<WorksheetTeacherModel?> fetchWorksheets() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherWorksheets();
    worksheets = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// إضافة worksheet جديد
  Future<WorksheetTeacherPost?> addWorksheet(WorksheetTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addTeacherWorksheet(request);
    addedWorksheet = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// جلب تفاصيل worksheet معين
  Future<WorksheetTeacherDetailes?> fetchWorksheetDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getWorksheetDetails(id);
    worksheetDetails = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// تعديل worksheet موجود
  Future<WorksheetTeacherUpdate?> updateWorksheet(int id, WorksheetTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateWorksheet(id, request);
    updatedWorksheet = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// حذف worksheet
  Future<WorksheetTeacherDelete?> deleteWorksheet(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteWorksheet(id);
    deletedWorksheet = result;

    isLoading = false;
    notifyListeners();
    return result;
  }
}
