import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import 'package:telmeeth/core/api/student/model/response/bus_details_model.dart';

class BusDetailsService {
  Dio? dio;

  Future<BusDetailsModel?> getBusDetails() async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get("/student/bus-details");

      if (response.statusCode == 200 && response.data['status'] == true) {
        return BusDetailsModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Bus Details API error: $e");
      return null;
    }
  }

}