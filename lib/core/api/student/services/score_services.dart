import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/request/uplode_score_request.dart';
import 'package:telmeeth/core/api/student/model/response/score_model.dart';
import 'package:telmeeth/core/api/student/model/response/uplode_score_model.dart';

class ScoreServices {
  Dio? dio;

  Future<ScoreModel?> getScore() async {
    try {
      Dio dio = await ApiClient.getDio();

      final response = await dio.get("/student/scores");

      print("Scores API Response: ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return ScoreModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Score API error: $e");
      return null;
    }
  }

  Future<UplodeScoreModel> uplodeScore(UplodeScoreRequest request) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.post(
        "/student/upload/score",
        data: request.toJson(),
      );

      if (response.statusCode == 200 && response.data != null) {
        return UplodeScoreModel.fromJson(response.data);
      } else {
        return UplodeScoreModel(
          message: "Failed to Uplode Score (Status code: ${response.statusCode})",
        );
      }
    } catch (e) {
      print("Uplode Score error: $e");
      return UplodeScoreModel(
        message: "Failed to Uplode Score due to error",
      );
    }
  }
}