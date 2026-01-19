import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/teacher/model/request/complete_profile_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/request/update_profile_teacher_request.dart';
import 'package:telmeeth/core/api/teacher/model/response/profile_teacher_complet.dart';
import 'package:telmeeth/core/api/teacher/model/response/profile_teacher_model.dart';
import 'package:telmeeth/core/api/teacher/model/response/profile_teacher_update.dart';
import 'package:telmeeth/core/api/teacher/services/profile_teacher_service.dart';

class ProfileTeacherController extends ChangeNotifier {
  final ProfileTeacherService _service = ProfileTeacherService();

  bool isLoading = false;

  // نتائج الميثودات
  ProfileTeacherModel? profileModel;
  ProfileTeacherCompleteModel? completeResult;
  ProfileTeacherUpdateModel? updateResult;

  // ================= Get Profile =================
  Future<ProfileTeacherModel?> getProfile() async {
    isLoading = true;
    notifyListeners();

    final result = await _service.getProfile();
    profileModel = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // ================= Complete Profile =================
  Future<ProfileTeacherCompleteModel?> completeProfile(
      CompletProfileTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.completeProfile(request);
    completeResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }

  // ================= Update Profile =================
  Future<ProfileTeacherUpdateModel?> updateProfile(
      UpdateProfileTeacherRequest request) async {
    isLoading = true;
    notifyListeners();

    final result = await _service.updateProfile(request);
    updateResult = result;

    isLoading = false;
    notifyListeners();

    return result;
  }
}
