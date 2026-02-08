import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/interactive_lesson_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_detailes.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_lesson_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/interactive_lesson_teacher_service.dart';

class InteractiveLessonTeacherController extends ChangeNotifier {
  final InteractiveLessonTeacherService _service = InteractiveLessonTeacherService();

  bool isLoading = false;

  /// GET all interactive lessons
  Future<InteractiveLessonTeacherModel?> fetchInteractiveLessons() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getInteractiveLessons();

    isLoading = false;
    notifyListeners();

    return result; // بيرجع الموديل مباشرة
  }

  /// GET details of a single interactive lesson
  Future<InteractiveLessonTeacherDetails?> fetchInteractiveLessonDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getInteractiveLessonDetails(id);

    isLoading = false;
    notifyListeners();

    return result; // بيرجع الموديل مباشرة
  }

  /// POST: add a new interactive lesson
  Future<InteractiveLessonTeacherPost?> addInteractiveLesson(
      InteractiveLessonRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addInteractiveLesson(request);

    isLoading = false;
    notifyListeners();

    return result; // بيرجع الموديل مباشرة
  }

  /// POST: update an existing interactive lesson
  Future<InteractiveLessonTeacherUpdate?> updateInteractiveLesson(
      int id, InteractiveLessonRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateInteractiveLesson(id, request);

    isLoading = false;
    notifyListeners();

    return result; // بيرجع الموديل مباشرة
  }

  /// DELETE: remove an interactive lesson
  Future<InteractiveLessonTeacherDelete?> deleteInteractiveLesson(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteInteractiveLesson(id);

    isLoading = false;
    notifyListeners();

    return result; // بيرجع الموديل مباشرة
  }
}
