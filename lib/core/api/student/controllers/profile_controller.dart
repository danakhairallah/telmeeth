import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/student/model/request/profile_complet_request.dart';
import 'package:telmeeth/core/api/student/model/request/update_profile_requect.dart';
import 'package:telmeeth/core/api/student/model/response/complet_profile_response.dart';
import 'package:telmeeth/core/api/student/model/response/profile_model.dart';
import 'package:telmeeth/core/api/student/services/profile_services.dart';

class ProfileController with ChangeNotifier{
  ProfileServices _services = ProfileServices();

  ProfileModel? profileModel;
  CompletProfileResponse? completProfileResponse;
  bool isLoading = false;

  Future<void> getStudentProfile() async {
    isLoading = true;
    notifyListeners();

    profileModel = await _services.getStudentProfile();

    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile(UpdateProfileRequest request) async {
    isLoading = true;
    notifyListeners();

    try {
      final updatedProfile = await _services.updateProfile(request);
      if (updatedProfile != null) {
        profileModel = updatedProfile;
        notifyListeners();
      } else {
        print("Profile update failed");
      }
    } catch (e) {
      print("Update Profile Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<CompletProfileResponse?> completProfile(ProfileCompletRequest request) async {
    isLoading = true;
    notifyListeners();

    try {
      final completProfile = await _services.completProfile(request);

      if (completProfile != null) {
        completProfileResponse = completProfile;
        notifyListeners();
      } else {
        print("Complete update failed");
      }
    } catch (e) {
      print("Complete Profile Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return null;
  }

  /// إعادة تعيين الرد
  void clearProfile() {
    profileModel = null;
    notifyListeners();
  }
}
