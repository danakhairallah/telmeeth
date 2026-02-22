import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import '../model/request/first_ticket_request_model.dart';
import '../model/request/second_ticket_request_model.dart';
import '../model/response/first_ticket_model.dart';
import '../model/response/second_ticket_model.dart';

class TicketService {
  Dio? dio;

  Future<FirstTicketModel?> createFirstTicket( FirstTicketRequestModel request) async {
  try {
    final dio = await ApiClient.getDio();

    final response = await dio.post(
      "/parent/first-ticket",
      data: request.toJson(),
    );

    if (response.statusCode == 200) {
      return FirstTicketModel.fromJson(response.data);
    } else {
      print("Error: ${response.statusCode} - ${response.data}");
      return null;
    }
  } catch (e) {
    print("Create First Ticket Error: $e");
    return null;
  }
  }

  Future<SecondTicketModel?> createSecondTicket(
      SecondTicketRequestModel request) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.post(
        "/parent/second-ticket",
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return SecondTicketModel.fromJson(response.data);
      } else {
        print("Error: ${response.statusCode} - ${response.data}");
        return null;
      }
    } catch (e) {
      print("Create Second Ticket Error: $e");
      return null;
    }
  }}