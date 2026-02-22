import 'package:dio/dio.dart';
import 'package:telmeeth/core/api/api_client.dart';
import '../model/response/bus_tracking_model.dart';
import '../model/response/student_trips_model.dart';

class BusService {
  Dio? dio;

  Future<BusTrackingModel?> getBusTracking(int studentId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        "/parent/bus-tracking/$studentId",
      );

      if (response.statusCode == 200) {
        return BusTrackingModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Bus Tracking by ID error: $e");
      return null;
    }
  }

  Future<StudentTripsModel?> getStudentTrips(int studentId) async {
    try {
      final dio = await ApiClient.getDio();

      final response = await dio.get(
        "/parent/student-trips/$studentId",
      );

      if (response.statusCode == 200) {
        return StudentTripsModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      print("Get Student Trips by ID error: $e");
      return null;
    }
  }
}