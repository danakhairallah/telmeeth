import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/parent/model/request/transfer_update_request.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_delete.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_details.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_model.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_update.dart';

class TransferServices {
  Dio? dio;

 Future<TransferModel?> getTransferRequest() async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.get(
      "/parent/transfer-requests",
      options: Options(headers: {
        "Authorization": "Bearer $token",
      }),
    );

    print("Response: ${response.data}");

    if (response.statusCode == 200) {
      return TransferModel.fromJson(response.data);
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

Future<TransferDetails?> getTransferRequestById(int id) async {
    try {
      final dio = await ApiClient.getDio();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("accessToken") ?? "";

      final response = await dio.get(
        "/parent/transfer-requests/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return TransferDetails.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Transfer Request by ID error: $e");
      return null;
    }
  }

  Future<TransferUpdate?> updateTransferRequest({
  required int id,
  required TransferUpdateRequest request,
}) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.put(
      "/parent/transfer-requests/$id",
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
      return TransferUpdate.fromJson(response.data);
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

Future<TransferDelete?> deleteTransferRequest({
  required int id,
}) async {
  try {
    final dio = await ApiClient.getDio();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken") ?? "";

    final response = await dio.delete(
      "/parent/transfer-requests/$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    print("Status Code: ${response.statusCode}");
    print("Response: ${response.data}");

    if (response.statusCode == 200) {
      return TransferDelete.fromJson(response.data);
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