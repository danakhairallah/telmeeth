import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/task_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/task_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/task_teacher_service.dart';

class TaskTeacherController extends ChangeNotifier {
  final TaskTeacherService _service = TaskTeacherService();

  bool isLoading = false;

  TaskTeacherModel? taskModel;
  TaskTeacherPost? taskPost;
  TaskTeacherDetails? taskDetails;
  TaskTeacherUpdate? taskUpdate;
  TaskTeacherDelete? taskDelete;

  /// جلب كل المهام
  Future<TaskTeacherModel?> fetchTasks() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherTasks();
    taskModel = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// إضافة مهمة جديدة
  Future<TaskTeacherPost?> addTask(TaskTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addTeacherTask(request);
    taskPost = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// جلب تفاصيل مهمة معينة
  Future<TaskTeacherDetails?> fetchTaskDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getTeacherTaskDetails(id);
    taskDetails = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// تحديث مهمة
  Future<TaskTeacherUpdate?> updateTask(int id, TaskTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateTeacherTask(id, request);
    taskUpdate = result;

    isLoading = false;
    notifyListeners();
    return result;
  }

  /// حذف مهمة
  Future<TaskTeacherDelete?> deleteTask(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteTeacherTask(id);
    taskDelete = result;

    isLoading = false;
    notifyListeners();
    return result;
  }
}
