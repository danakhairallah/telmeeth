import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/task_details_model.dart';
import 'package:telmeeth/core/api/parent/model/response/tasks_model.dart';
import 'package:telmeeth/core/api/parent/services/task_service.dart';

class TaskControllerParent extends ChangeNotifier {
  final TaskService _service;

  TaskControllerParent(this._service);

  bool isTasksLoading = false;
  bool isDetailsLoading = false;

  String? error;

  TasksModel? tasksModel;
  TaskDetailsModel? taskDetailsModel;

  // ================= FETCH TASKS =================

  Future<void> fetchTasks(int studentId) async {
    try {
      isTasksLoading = true;
      error = null;
      tasksModel = null;
      notifyListeners();

      final result = await _service.getTask(studentId);

      if (result != null) {

        // 👇 إذا السيرفر رجع فاضي نضيف موك
        if (result.data == null || result.data!.isEmpty) {
          result.data = [
            Datum(
              id: 1,
              title: "Math Worksheet",
              type: "worksheet",
              subjectNameAr: "رياضيات",
              deadline: DateTime.now().add(const Duration(days: 3)),
            ),
            Datum(
              id: 2,
              title: "Science Homework",
              type: "task",
              subjectNameAr: "علوم",
              deadline: DateTime.now().add(const Duration(days: 1)),
            ),
          ];
        }

        tasksModel = result;

      } else {
        error = "Failed to load tasks";
      }

    } catch (e) {
      error = e.toString();
    }

    isTasksLoading = false;
    notifyListeners();
  }

  // ================= FETCH DETAILS =================

  Future<void> fetchTaskDetails(int studentId, int taskId) async {
    try {
      isDetailsLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getTaskDetails(studentId, taskId);

      if (result != null) {
        taskDetailsModel = result;
      } else {
        error = "Failed to load task details";
      }

    } catch (e) {
      error = e.toString();
    }

    isDetailsLoading = false;
    notifyListeners();
  }
}