import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telmeeth/core/api/model/response/api_response.dart';
import 'package:telmeeth/core/api/model/response/user.dart';
import 'package:telmeeth/core/api/student/services/auth_services.dart';

class AuthController extends ChangeNotifier {
  final AuthServices authServices = AuthServices();
  User? user;

  Future<ApiResponse<User>> login({
    required String username,
    required String password,
  }) async {
    // استدعاء الخدمة
    ApiResponse<User> response =
        await authServices.login(userName: username, password: password);

    // إذا تم تسجيل الدخول بنجاح
    if (response.statusCode == 200 && response.data != null) {
      setUser(user: response.data!);
      // التوكن بالفعل حفظناه في SharedPreferences داخل AuthServices
    }

    return response;
  }

  void setUser({required User user}) {
    this.user = user;
    notifyListeners();
  }

  // لو تريد حفظ التوكن يدويًا (اختياري)
  Future<void> saveTokenOnSharedPrefs({required String accessToken}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("accessToken", accessToken);
  }
}
