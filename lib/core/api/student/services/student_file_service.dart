import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/student_file_model.dart';

class StudentFileService {
  Future<List<StudentFileModel>?> getStudentFiles() async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      print("StudentFileService | Token: $token");

      final response = await dio.get(
        "/student-files",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      print("StudentFileService | Raw response.data: ${response.data}");
      print("StudentFileService | statusCode: ${response.statusCode}");

      if (response.statusCode == 200 && response.data is List) {
        print("StudentFileService | Data is List, length: ${(response.data as List).length}");
        var dataList = (response.data as List)
            .map((e) => StudentFileModel.fromJson(e))
            .toList();
        print("StudentFileService | Parsed StudentFileModel list: $dataList");
        return dataList;
      }
      print("StudentFileService | Data is NOT a List or status not 200");
      return null;
    } catch (e) {
      print("StudentFileService error: $e");
      return null;
    }
  }
}
