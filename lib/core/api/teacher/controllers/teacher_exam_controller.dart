import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_exam_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_exam_update.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_exam_service.dart';

class TeacherExamController extends ChangeNotifier {
  final TeacherExamService _service = TeacherExamService();

  bool isLoading = false;

  TeacherExamModel? examsModel;
  TeacherExamDetails? examDetailsModel;
  TeacherExamPost? postResult;
  TeacherExamUpdate? updateResult;
  TeacherExamDelete? deleteResult;

  /// GET all exams
  Future<TeacherExamModel?> fetchTeacherExams() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherExams();
    examsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// GET exam details by id
  Future<TeacherExamDetails?> fetchTeacherExamDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherExamDetails(id);
    examDetailsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// POST add exam
  Future<TeacherExamPost?> addTeacherExam(
      TeacherExamRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addTeacherExam(request);
    postResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// PUT update exam
  Future<TeacherExamUpdate?> editTeacherExam(
    int id,
    TeacherExamRequest request,
  ) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateTeacherExam(id, request);
    updateResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// DELETE exam
  Future<TeacherExamDelete?> removeTeacherExam(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteTeacherExam(id);
    deleteResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
