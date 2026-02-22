import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/request/first_ticket_request_model.dart';
import 'package:telmeeth/core/api/parent/model/request/second_ticket_request_model.dart';
import 'package:telmeeth/core/api/parent/model/response/first_ticket_model.dart';
import 'package:telmeeth/core/api/parent/model/response/second_ticket_model.dart';
import 'package:telmeeth/core/api/parent/services/ticket_service.dart';

class TicketController extends ChangeNotifier {
  final TicketService _service;

  TicketController(this._service);

  bool isLoading = false;
  String? error;

  FirstTicketModel? firstTicket;
  SecondTicketModel? secondTicket;

  Future<void> createFirstTicket(FirstTicketRequestModel request) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.createFirstTicket(request);

      if (result != null) {
        firstTicket = result;
      } else {
        error = "Failed to create first ticket";
      }
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> createSecondTicket(SecondTicketRequestModel request) async {

    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.createSecondTicket(request);

      if (result != null) {
        secondTicket = result;
      } else {
        error = "Failed to create second ticket";
      }
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}