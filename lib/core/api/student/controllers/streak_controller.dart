  import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/model/response/restore_streak_model.dart';
import 'package:telmeeth/core/api/student/model/response/streak_model.dart';
import 'package:telmeeth/core/api/student/model/response/streak_update_model.dart';
import 'package:telmeeth/core/api/student/services/streak_service.dart';

  class StreakController extends ChangeNotifier {
    final StreakServices _service = StreakServices();

    bool _isLoading = false;
    bool get isLoading => _isLoading;

    StreakLeaderboardModel? _leaderboard;
    StreakLeaderboardModel? get leaderboard => _leaderboard;

    StreakUpdateModel? _updateResult;
    StreakUpdateModel? get updateResult => _updateResult;

    RestoreStreakModel? _restoreStreakModel;          // ✅ جديد
    RestoreStreakModel? get restoreStreakModel => _restoreStreakModel; // ✅ getter

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

    Future<StreakUpdateModel?> updateStudentStreak(int studentId) async {
      _isLoading = true;
      notifyListeners();

      try {
        _updateResult = await _service.updateStreak(studentId);
        return _updateResult;
      } catch (e) {
        print("Controller updateStudentStreak error: $e");
        return null;
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
      _restoreStreakModel = null; // اختياري تنظفيه كمان
      notifyListeners();
    }

    Future<RestoreStreakModel?> restoreStreak(int lessonId) async {
      _isLoading = true;
      notifyListeners();

      try {
        final result = await _service.restoreStreak(lessonId);
        _restoreStreakModel = result;  // ✅ هيك صح
        return result;
      } catch (e) {
        print("Controller restoreStreak error: $e");
        return null;
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }