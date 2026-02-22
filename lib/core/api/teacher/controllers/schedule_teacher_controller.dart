import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/schedule_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/schedule_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/schedule_teacher_service.dart';

class ScheduleTeacherController extends ChangeNotifier {
  final ScheduleTeacherService _service = ScheduleTeacherService();

  bool isLoading = false;

  ScheduleTeacherModel? schedulesModel;
  ScheduleTeacherPost? postModel;
  ScheduleTeacherDetails? detailsModel;
  ScheduleTeacherUpdate? updateModel;
  ScheduleTeacherDelete? deleteModel;

  /// GET جميع الجداول
  Future<ScheduleTeacherModel?> fetchSchedules() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getSchedules();
    schedulesModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// POST إضافة جدول جديد
  Future<ScheduleTeacherPost?> addSchedule(ScheduleTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addSchedule(request);
    postModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// GET تفاصيل جدول معين
  Future<ScheduleTeacherDetails?> fetchScheduleDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getScheduleDetails(id);
    detailsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// PUT تعديل جدول
  Future<ScheduleTeacherUpdate?> updateSchedule(int id, ScheduleTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateSchedule(id, request);
    updateModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// DELETE حذف جدول
  Future<ScheduleTeacherDelete?> deleteSchedule(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteSchedule(id);
    deleteModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
