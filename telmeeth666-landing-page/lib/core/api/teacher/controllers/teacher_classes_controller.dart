import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/teacher_classes_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/classes_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/teacher_classes_update.dart';
import 'package:telmeeth/core/api/teacher/services/teacher_classes_service.dart';

class TeacherClassesController extends ChangeNotifier {
  final TeacherClassesService _service = TeacherClassesService();

  bool isLoading = false;

  ClassesTeacherModel? classesModel;
  ClassesTeacherDetailes? detailsModel;
  ClassesTeacherPost? postResult;
  ClassesTeacherUpdate? updateResult;
  ClassesTeacherDelete? deleteResult;

  /// GET all classes
  Future<ClassesTeacherModel?> fetchTeacherClasses() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherClasses();
    classesModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// GET by id
  Future<ClassesTeacherDetailes?> fetchTeacherClassDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherClassDetails(id);
    detailsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// POST
  Future<ClassesTeacherPost?> addTeacherClass(
      TeacherClassesRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.postTeacherClass(request);
    postResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// PUT
  Future<ClassesTeacherUpdate?> editTeacherClass(
    int id,
    TeacherClassesRequest request,
  ) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateTeacherClass(id, request);
    updateResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// DELETE
  Future<ClassesTeacherDelete?> removeTeacherClass(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteTeacherClass(id);
    deleteResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
