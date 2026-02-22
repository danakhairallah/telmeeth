import 'dart:io';
import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/preparing_lesson_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/preparing_lesson_model.dart';
import 'package:telmeeth/core/api/teacher/services/preparing_lesson_service.dart';

class PreparingLessonController extends ChangeNotifier {
  final PreparingLessonService service;

  PreparingLessonController(this.service);

  /// =========================
  /// State
  /// =========================
  bool isLoading = false;
  String? error;
  PreparingLessonModel? preparingLessonModel;
  File? lessonFile;

  /// =========================
  /// GET Preparing Lesson (JSON)
  /// =========================
  Future<PreparingLessonModel?> getPreparingLesson() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final model = await service.getPreparingLesson();
      if (model != null) {
        preparingLessonModel = model;
      } else {
        error = "Failed to load preparing lesson";
      }
      return model;
    } catch (e) {
      error = "Error: $e";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// =========================
  /// DOWNLOAD Preparing Lesson (PDF / File)
  /// =========================
  Future<File?> downloadPreparingLesson(String savePath , PreparingLessonRequest request) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final file = await service.downloadPreparingLesson(savePath , request);
      if (file != null) {
        lessonFile = file;
      } else {
        error = "Failed to download preparing lesson";
      }
      return file;
    } catch (e) {
      error = "Download Error: $e";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}