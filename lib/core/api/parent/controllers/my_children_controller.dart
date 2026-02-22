import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/my_children_detalis_model.dart';
import 'package:telmeeth/core/api/parent/model/response/my_children_model.dart';
import 'package:telmeeth/core/api/parent/services/my_children_service.dart';

class MyChildrenController extends ChangeNotifier {
  final MyChildrenService _service = MyChildrenService();

  bool isLoading = false;
  String? errorMessage;

  MyChildrenModel? childrenModel;
  MyChildrenDetalisModel? childDetails;

  // ================= GET ALL CHILDREN =================
  Future<MyChildrenModel?> getMyChildren() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      childrenModel = await _service.getMyChildren();
      return childrenModel;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= GET CHILD BY ID =================
  Future<MyChildrenDetalisModel?> getMyChildById(int studentId) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      childDetails = await _service.getMyChildrenById(studentId);
      return childDetails;
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
