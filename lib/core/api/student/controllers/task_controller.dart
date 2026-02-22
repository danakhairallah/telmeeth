import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/request/task_request.dart';
import 'package:telmeeth/core/api/student/model/response/task.dart';
import 'package:telmeeth/core/api/student/model/response/task_detile_response.dart';
import 'package:telmeeth/core/api/student/model/response/task_result_response.dart';
import 'package:telmeeth/core/api/student/model/response/task_submit_response.dart';
import 'package:telmeeth/core/api/student/services/task_services.dart';

import 'package:flutter/material.dart';

class TaskController extends ChangeNotifier {
  final TaskServices _service = TaskServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// ===== قائمة التاسكات =====
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  /// ===== تفاصيل التاسك + الأسئلة =====
  TaskDetailData? _selectedTask;
  TaskDetailData? get selectedTask => _selectedTask;

  /// ===== نتيجة التاسك =====
  TaskResultResponse? _taskResult;
  TaskResultResponse? get taskResult => _taskResult;

  /// ===============================
  /// جلب كل التاسكات
  /// ===============================
  Future<void> getTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await _service.getTasks();
    } catch (e) {
      debugPrint("Controller getTasks error: $e");
      _tasks = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// ===============================
  /// جلب تفاصيل التاسك حسب ID
  /// ===============================
  Future<void> getTaskById(int taskId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _service.getTaskById(taskId);
      _selectedTask = response?.data;
    } catch (e) {
      debugPrint("Controller getTaskById error: $e");
      _selectedTask = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// ===============================
  /// إرسال إجابات التاسك
  /// ===============================
  Future<TaskSubmitResponse> submitTask(int taskId, TaskSubmitRequest request) async {
  _isLoading = true;
  notifyListeners();

  try {
    // استدعاء الخدمة
    final response = await _service.submitTask(taskId, request);

    // نرجع response مباشرة (حتى لو totalMark null)
    return response;
  } catch (e) {
    debugPrint("Controller submitTask error: $e");

    // نرجع response مع رسالة خطأ بدلاً من null
    return TaskSubmitResponse(
      message: "Failed to submit task",
      totalMark: null,
    );
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}

  /// ===============================
  /// جلب نتيجة التاسك
  /// ===============================
  Future<TaskResultResponse?> getTaskResult(int taskId) async {
  _isLoading = true;
  notifyListeners();

  try {
    // استدعاء الخدمة
    _taskResult = await _service.getTaskResult(taskId);
    return _taskResult;
  } catch (e) {
    debugPrint("Controller getTaskResult error: $e");
    _taskResult = null;
    return null;
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}


  /// ===============================
  /// تنظيف البيانات
  /// ===============================
  void clearSelectedTask() {
    _selectedTask = null;
    _taskResult = null;
    notifyListeners();
  }
}

