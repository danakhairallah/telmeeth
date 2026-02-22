import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import '../model/response/semester_days_model.dart';

class SemesterDaysService {
  Dio? dio;

  Future<SemesterDaysModel?> getSemsterDays(int studentId) async {
    try {
      final dio = await ApiClient.getDio();

      final response =
      await dio.get("/parent/semester-days/$studentId");

      if (response.statusCode == 200 &&
          response.data['success'] == true) {
        return SemesterDaysModel.fromJson(response.data);
      }

      return null;

    } on DioException catch (e) {

      if (e.response?.statusCode == 404) {
        print("No semester set yet for this school");
        return null; // 👈 مهم
      }

      print("Semester Dio Error: ${e.response?.data}");
      return null;

    } catch (e) {
      print("Unexpected Semester Error: $e");
      return null;
    }
  }}