import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/response/worksheet_parent_model.dart';

class WorksheetParentService {
  Dio? dio;

  Future<WorksheetParentModel?> getParentWorksheet(
      int studentId,
      int worksheetId,
      ) async {
    try {
      final dio = await ApiClient.getDio();

      print("BASE URL: ${dio.options.baseUrl}");
      print("ENDPOINT: /parent/worksheets/$studentId/$worksheetId");

      final response = await dio.get(
        "/parent/worksheets/$studentId/$worksheetId",
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE TYPE: ${response.data.runtimeType}");
      print("RESPONSE DATA: ${response.data}");

      if (response.statusCode == 200) {
        return WorksheetParentModel.fromJson(response.data);
      }

      return null;

    } catch (e) {
      print("❌ WORKSHEET ERROR");
      print("ERROR TYPE: ${e.runtimeType}");
      print("ERROR DETAILS: $e");

      if (e is DioException) {
        print("DIO STATUS: ${e.response?.statusCode}");
        print("DIO DATA: ${e.response?.data}");
        print("DIO URL: ${e.requestOptions.uri}");
      }

      return null;
    }
  }}