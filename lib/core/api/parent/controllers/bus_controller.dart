import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/parent/model/response/bus_tracking_model.dart';
import 'package:telmeeth/core/api/parent/model/response/student_trips_model.dart';
import 'package:telmeeth/core/api/parent/services/bus_service.dart';

class BusController extends ChangeNotifier {
  final BusService _service;

  BusController(this._service);

  bool isTrackingLoading = false;
  bool isTripsLoading = false;

  String? error;

  BusTrackingModel? trackingModel;
  StudentTripsModel? tripsModel;

  Future<void> fetchBusTracking(int studentId) async {
    try {
      isTrackingLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getBusTracking(studentId);

      if (result != null) {
        trackingModel = result;
      } else {
        error = "Failed to load bus tracking";
      }
    } catch (e) {
      error = e.toString();
    }

    finally {
      isTrackingLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStudentTrips(int studentId) async {
    try {
      isTripsLoading = true;
      error = null;
      notifyListeners();

      final result = await _service.getStudentTrips(studentId);

      if (result != null) {
        tripsModel = result;
      } else {
        error = "Failed to load trips";
      }
    } catch (e) {
      error = e.toString();
    }

    isTripsLoading = false;
    notifyListeners();
  }
}