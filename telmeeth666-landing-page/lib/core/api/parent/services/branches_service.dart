import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/branches_model.dart';

class BranchesService {
  Dio? dio;

  Future<BranchesModel?> getBranchesBySchoolId(int schoolId) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/parent/branches/$schoolId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      return BranchesModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Branches Error: $e");
    return null;
  }
}

Future<BranchesModel?> getStudentSchoolBranches(int studentId) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/parent/students/$studentId/school-branches",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      return BranchesModel.fromJson(response.data);
    } else {
      return null;
    }
  } catch (e) {
    print("Get Student Branches Error: $e");
    return null;
  }
}

}