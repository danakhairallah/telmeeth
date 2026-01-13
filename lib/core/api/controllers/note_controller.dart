import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/model/request/nots_request.dart';
import 'package:telmeeth/core/api/model/response/note_model.dart';
import 'package:telmeeth/core/api/student/services/note_services.dart';

class NoteController extends ChangeNotifier {
  final NoteServices _services = NoteServices();

  Note? note;

  bool isLoading = false;
  bool isError = false;
  String errorMessage = "";

  /// جلب النوت حسب lessonId
  Future<void> getNoteById(int lessonId) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      final result = await _services.getNotsById(lessonId);
      note = result?.note;

      if (note == null) {
        isError = false; // ليس خطأ، فقط لا توجد نوت بعد
        errorMessage = "No notes available";
      }
    } catch (e) {
      isError = true;
      errorMessage = "Error fetching note: $e";
    }

    isLoading = false;
    notifyListeners();
  }

  /// إضافة نوت جديد
  Future<bool> addNote(int lessonId, NotsRequest noteRequest) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      final result = await _services.addNotesById(lessonId, noteRequest);
      if (result != null && result.note != null) {
        note = result.note;
        notifyListeners();
        return true;
      } else {
        isError = true;
        errorMessage = "Failed to add note";
        return false;
      }
    } catch (e) {
      isError = true;
      errorMessage = "Error adding note: $e";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// تحديث النوت
  Future<bool> updateNote(int noteId, NotsRequest noteRequest) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      final updated = await _services.updateNotesById(noteId, noteRequest);
      if (updated != null) {
        note = updated;
        notifyListeners();
        return true;
      } else {
        isError = true;
        errorMessage = "Failed to update note";
        return false;
      }
    } catch (e) {
      isError = true;
      errorMessage = "Error updating note: $e";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// حذف النوت
  Future<bool> deleteNote(int noteId) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      final deleted = await _services.deleteNoteById(noteId);
      if (deleted) {
        note = null;
        notifyListeners();
        return true;
      } else {
        isError = true;
        errorMessage = "Failed to delete note";
        return false;
      }
    } catch (e) {
      isError = true;
      errorMessage = "Error deleting note: $e";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

