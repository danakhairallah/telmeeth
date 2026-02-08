import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/streak_leaderbored.dart' show StreakLeaderboardModel;
import 'package:telmeeth/core/api/student/services/streak_leaderboard_service.dart';

class StreakController extends ChangeNotifier {
  final StreakServices _service = StreakServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  StreakLeaderboardModel? _leaderboard;
  StreakLeaderboardModel? get leaderboard => _leaderboard;

  /// ===== جلب الـ Leaderboard =====
  Future<void> getLeaderboard() async {
    _isLoading = true;
    notifyListeners();

    try {
      _leaderboard = await _service.getStreakLeaderboard();
    } catch (e) {
      print("Controller getLeaderboard error: $e");
      _leaderboard = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// ===== إعادة تحميل =====
  Future<void> refresh() async {
    await getLeaderboard();
  }

  /// ===== مسح البيانات =====
  void clear() {
    _leaderboard = null;
    notifyListeners();
  }
}
