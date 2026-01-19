import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/request/profile_parent_complete_request.dart';
import 'package:telmeeth/core/api/parent/model/request/profile_parent_update_request.dart';
import 'package:telmeeth/core/api/parent/model/response/profile_parent_complete.dart';
import 'package:telmeeth/core/api/parent/model/response/profile_parent_model.dart';
import 'package:telmeeth/core/api/parent/model/response/profile_parent_update.dart';

class ProfileParentServices {
  Dio? dio;

  Future<ProfileParentModel?> getParentProfile() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/profile",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      print("PROFILE API RAW RESPONSE:");
      print(response.data);
      if (response.statusCode == 200) {
        return ProfileParentModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Parent Profile error: $e");
      return null;
    }
  }

  Future<ProfileParentComplete?> completeParentProfile({
  required ProfileParentCompletRequest request,
}) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.post(
      "/parent/complete-profile",
      data: request.toJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    print("Status Code: ${response.statusCode}");
    print("Response: ${response.data}");

    if (response.statusCode == 200) {
      return ProfileParentComplete.fromJson(response.data);
    }

    return null;
  } catch (e) {
    if (e is DioException) {
      print("Dio error: ${e.response?.data}");
    } else {
      print("Unexpected error: $e");
    }
    return null;
  }
}

Future<ProfileParentUpdate?> updateParentProfile({
  required ProfileParentUpdateRequest request,
}) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.post(
      "/parent/update-info",
      data: request.toJson(),
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    print("Status Code: ${response.statusCode}");
    print("Response: ${response.data}");

    if (response.statusCode == 200) {
      return ProfileParentUpdate.fromJson(response.data);
    }

    return null;
  } catch (e) {
    if (e is DioException) {
      print("Dio error: ${e.response?.data}");
    } else {
      print("Unexpected error: $e");
    }
    return null;
  }
}


}