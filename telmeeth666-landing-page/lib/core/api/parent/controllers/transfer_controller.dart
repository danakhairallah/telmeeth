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
