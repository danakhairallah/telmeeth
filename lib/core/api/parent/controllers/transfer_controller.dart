import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/request/transfer_update_request.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_delete.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_details.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_model.dart';
import 'package:telmeeth/core/api/parent/model/response/transfer_update.dart';
import 'package:telmeeth/core/api/parent/services/transfer_services.dart';

class TransferController extends ChangeNotifier {
  final TransferServices _services = TransferServices();

  bool isLoading = false;
  String? error;

  TransferModel? transferModel;
  TransferDetails? transferDetails;
  TransferUpdate? transferUpdate;
  TransferDelete? transferDelete;

  // ---------------------------
  // Create Transfer Request (الدالة الجديدة)
  // ---------------------------
  Future<bool> addTransferRequest({
    required int studentId,
    required int branchId,
    required String type,
    required String date,
    int? schoolId, // في حال بدك ترسل school_id كمان
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final success = await _services.createTransferRequest(
        studentId: studentId,
        branchId: branchId,
        type: type,
        date: date,
        schoolId: schoolId,
      );
      if (success) {
        // ممكن تحدث قائمة الطلبات مباشرة إذا بدك
        await getTransfers();
        error = null;
      }
      return success;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ---------------------------
  // Get All Transfers
  // ---------------------------
  Future<TransferModel?> getTransfers() async {
    isLoading = true;
    notifyListeners();

    try {
      transferModel = await _services.getTransferRequest();
      error = null;
      return transferModel;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ---------------------------
  // Get Transfer By ID
  // ---------------------------
  Future<TransferDetails?> getTransferById(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      transferDetails = await _services.getTransferRequestById(id);
      return transferDetails;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ---------------------------
  // Update
  // ---------------------------
  Future<TransferUpdate?> updateTransfer(int id, TransferUpdateRequest request) async {
    isLoading = true;
    notifyListeners();

    try {
      transferUpdate = await _services.updateTransferRequest(
        id: id,
        request: request,
      );
      return transferUpdate;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ---------------------------
  // Delete
  // ---------------------------
  Future<TransferDelete?> deleteTransfer(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      transferDelete = await _services.deleteTransferRequest(id: id);
      return transferDelete;
    } catch (e) {
      error = e.toString();
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
