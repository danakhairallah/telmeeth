import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/model/response/ai_advice_data.dart';
import 'package:telmeeth/core/api/model/response/ai_advice_model.dart';
import 'package:telmeeth/core/api/student/services/ai_advice_services.dart';

class AiAdviceController with ChangeNotifier {
  final AiAdviceServices _services = AiAdviceServices();

  AiAdviceModel? adviceModel;
  List<AiAdviceData> allAdvices = [];
  bool isLoading = false;

  // ================= GET LATEST LIST =================
  Future<void> getAiAdvices() async {
    isLoading = true;
    notifyListeners();

    try {
      adviceModel = await _services.getAiAdvices();
    } catch (e) {
      print("Get AI Advice Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= GET ALL (HISTORY) =================
  Future<void> getAllAiAdvices() async {
    isLoading = true;
    notifyListeners();

    try {
      allAdvices = await _services.getAllAiAdvices();
    } catch (e) {
      print("Get All AI Advices Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= GET LATEST =================
  AiAdviceData? get latestAdvice {
    if (adviceModel == null || adviceModel!.data.isEmpty) return null;
    return adviceModel!.data.first;
  }

}
