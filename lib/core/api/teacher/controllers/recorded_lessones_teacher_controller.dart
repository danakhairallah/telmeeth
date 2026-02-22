import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/recorded_lessones_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/recorded_lessones_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/recorded_lessones_service.dart';

class RecordedLessonsTeacherController extends ChangeNotifier {
  final RecordedLessonsTeacherService _service = RecordedLessonsTeacherService();

  bool isLoading = false;

  RecordedLessonesTeacherModel? recordedLessons;
  RecordedLessonesTeacherDetails? lessonDetails;
  RecordedLessonesTeacherPost? addedLesson;
  RecordedLessonesTeacherUpdate? updatedLesson;
  RecordedLessonesTeacherDelete? deletedLesson;

  /// جلب كل الدروس المسجلة
  Future<RecordedLessonesTeacherModel?> fetchRecordedLessons() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getRecordedLessons();
    recordedLessons = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// جلب تفاصيل درس مسجل معين
  Future<RecordedLessonesTeacherDetails?> fetchRecordedLessonDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getRecordedLessonDetails(id);
    lessonDetails = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// إضافة درس مسجل جديد
  Future<RecordedLessonesTeacherPost?> addRecordedLesson(RecordedLessonRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addRecordedLesson(request);
    addedLesson = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// تعديل درس مسجل موجود
  Future<RecordedLessonesTeacherUpdate?> updateRecordedLesson(
      int id, RecordedLessonRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateRecordedLesson(id, request);
    updatedLesson = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// حذف درس مسجل
  Future<RecordedLessonesTeacherDelete?> deleteRecordedLesson(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteRecordedLesson(id);
    deletedLesson = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
