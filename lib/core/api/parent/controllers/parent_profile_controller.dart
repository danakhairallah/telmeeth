import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/request/profile_parent_complete_request.dart';
import 'package:telmeeth/core/api/parent/model/request/profile_parent_update_request.dart';
import 'package:telmeeth/core/api/parent/model/response/profile_parent_complete.dart';
import 'package:telmeeth/core/api/parent/model/response/profile_parent_model.dart';
import 'package:telmeeth/core/api/parent/model/response/profile_parent_update.dart';
import 'package:telmeeth/core/api/parent/services/profile_parent_services.dart';

class ProfileParentController extends ChangeNotifier {
  final ProfileParentServices _services = ProfileParentServices();

  bool isLoading = false;
  String? errorMessage;

  ProfileParentModel? parentProfile;
  ProfileParentComplete? completeResponse;
  ProfileParentUpdate? updateResponse;

  // ================= GET PROFILE =================
  Future<ProfileParentModel?> getParentProfile() async {
    try {
      isLoading = true;
      notifyListeners();

      parentProfile = await _services.getParentProfile();
      return parentProfile;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= COMPLETE PROFILE =================
  Future<ProfileParentComplete?> completeParentProfile(
      ProfileParentCompletRequest request) async {
    try {
      isLoading = true;
      notifyListeners();

      completeResponse =
          await _services.completeParentProfile(request: request);

      return completeResponse;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<ProfileParentUpdate?> updateParentProfile(
      ProfileParentUpdateRequest request) async {
    try {
      isLoading = true;
      notifyListeners();

      updateResponse =
          await _services.updateParentProfile(request: request);

      return updateResponse;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
