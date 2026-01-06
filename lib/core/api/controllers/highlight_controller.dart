import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/model/request/highlight_request.dart';
import 'package:telmeeth/core/api/model/response/highlight_data.dart';
import 'package:telmeeth/core/api/model/response/highlight_model.dart';
import 'package:telmeeth/core/api/student/services/highlight_services.dart';

class HighlightController with ChangeNotifier {
  final HighlightServices _services = HighlightServices();

  HighlightModel? highlightModel;
  bool isLoading = false;

  // ================= GET =================
  Future<void> getHighlights() async {
    isLoading = true;
    notifyListeners();

    try {
      highlightModel = await _services.getHighlight();
    } catch (e) {
      print("Get Highlights Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= ADD =================
  Future<void> addHighlight(HighlightRequest request) async {
    isLoading = true;
    notifyListeners();

    try {
      final HighlightData? newHighlight =
          await _services.addHighlight(request);

      if (newHighlight != null) {
        highlightModel ??= HighlightModel(data: []);
        highlightModel!.data.add(newHighlight);
      } else {
        print("Add Highlight failed");
      }
    } catch (e) {
      print("Add Highlight Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= GET BY ID =================
  Future<HighlightData?> getHighlightById(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      final HighlightData? highlight = await _services.getHighlightById(id);
      return highlight;
    } catch (e) {
      print("Get Highlight by ID Error: $e");
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= UPDATE =================
  Future<void> updateHighlight({
    required int id,
    required HighlightRequest request,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final HighlightData? updated =
          await _services.updateHighlight(id, request);

      if (updated != null) {
        // البحث عن الـ highlight القديم واستبداله
        final index = highlightModel!.data.indexWhere((h) => h.id == id);
        if (index != -1) {
          highlightModel!.data[index] = updated;
        }
      } else {
        print("Update Highlight failed");
      }
    } catch (e) {
      print("Update Highlight Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= DELETE =================
  Future<void> deleteHighlight({required int id}) async {
  isLoading = true;
  notifyListeners();

  try {
    final success = await _services.deleteHighlight(id);
    if (success) {
      highlightModel!.data.removeWhere((h) => h.id == id);
    } else {
      print("Delete Highlight failed");
    }
  } catch (e) {
    print("Delete Highlight Error: $e");
  } finally {
    isLoading = false;
    notifyListeners();
  }
}

}
