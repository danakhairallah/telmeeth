import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/interactive_parts_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/request/interactive_parts_teacher_update_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_delete.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_details.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_post.dart';
import 'package:telmeeth/core/api/teacher/model/response/interactive_parts_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/interactive_parts_teacher_service.dart';

class InteractivePartsController extends ChangeNotifier {
  final InteractivePartsService _service = InteractivePartsService();

  bool isLoading = false;

  InteractivePartsModel? partsModel;
  InteractivePartsDetails? partDetails;
  InteractivePartsPost? addedParts;
  InteractivePartsUpdate? updatedPart;
  InteractivePartsDelete? deletedPart;

  /// جلب كل الأجزاء التفاعلية
  Future<InteractivePartsModel?> fetchInteractiveParts() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getInteractiveParts();
    partsModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// جلب تفاصيل جزء تفاعلي معين
  Future<InteractivePartsDetails?> fetchInteractivePartDetails(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getInteractivePartDetails(id);
    partDetails = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// إضافة أجزاء تفاعلية جديدة
  Future<InteractivePartsPost?> addInteractivePartsRequest(
      InteractivePartsRequestPost request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.addInteractiveParts(request);
    addedParts = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// تعديل جزء تفاعلي
  Future<InteractivePartsUpdate?> updateInteractivePartRequest(
      int id, InteractivePartsRequestUpdate request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateInteractivePart(id, request);
    updatedPart = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  /// حذف جزء تفاعلي
  Future<InteractivePartsDelete?> deleteInteractivePartRequest(int id) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.deleteInteractivePart(id);
    deletedPart = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
