import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/uplode_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/uplode_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/uplode_teacher_service.dart';

class UplodesTeacherController extends ChangeNotifier {
  final UplodesTeacherService _service = UplodesTeacherService();

  // الحالة العامة
  bool isLoading = false;

  // القوائم والموديلات
  UplodesTeacherModel? uploads;
  UplodesTeacherPost? uploadResult;
  UplodesTeacherDetails? uploadDetails;
  UplodesTeacherUpdate? uploadUpdate;
  UplodesTeacherDelete? uploadDelete;

  // =====================
  // جلب كل الملفات
  // =====================
  Future<UplodesTeacherModel?> fetchUploads() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getUploads();
    uploads = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  // =====================
  // رفع ملف جديد
  // =====================
  Future<UplodesTeacherPost?> addUpload(FileUploadRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.uploadFile(request);
    uploadResult = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  // =====================
  // تفاصيل ملف
  // =====================
  Future<UplodesTeacherDetails?> fetchUploadDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getUploadDetails(id);
    uploadDetails = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  // =====================
  // تحديث ملف
  // =====================
  Future<UplodesTeacherUpdate?> updateUploadFile(int id, FileUploadRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateUpload(id, request);
    uploadUpdate = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  // =====================
  // حذف ملف
  // =====================
  Future<UplodesTeacherDelete?> deleteUploadFile(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteUpload(id);
    uploadDelete = result;

    isLoading = false;
    notifyListeners();
    return result;
  }
}
