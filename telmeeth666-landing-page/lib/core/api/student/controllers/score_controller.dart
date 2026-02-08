import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/student/model/request/uplode_score_request.dart';
import 'package:telmeeth/core/api/student/model/response/score_model.dart';
import 'package:telmeeth/core/api/student/model/response/uplode_score_model.dart';
import 'package:telmeeth/core/api/student/services/score_services.dart';

class ScoreController with ChangeNotifier{
  final ScoreServices _services = ScoreServices();

  bool isLoading = false;
  ScoreServices? scoreServices;
  UplodeScoreModel? scoreResponse;
  ScoreModel? scoreModel;
   String? errorMessage;

  Future<void> getScore() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _services.getScore();

      if (result != null) {
        scoreModel = result;
      } else {
        errorMessage = "Failed to load Score";
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<UplodeScoreModel> uplodeScore(UplodeScoreRequest request) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await _services.uplodeScore(request);

      scoreResponse = result;

      return result;
    } catch (e) {
      errorMessage = e.toString();

      return UplodeScoreModel(
        message: errorMessage,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}