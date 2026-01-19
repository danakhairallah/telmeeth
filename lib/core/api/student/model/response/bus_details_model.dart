class BusDetailsResponse {
  final bool status;
  final int count;
  final List<BusDetail> data;

  BusDetailsResponse({
    required this.status,
    required this.count,
    required this.data,
  });

  factory BusDetailsResponse.fromJson(Map<String, dynamic> json) {
    return BusDetailsResponse(
      status: json['status'],
      count: json['count'],
      data: (json['data'] as List<dynamic>)
          .map((e) => BusDetail.fromJson(e))
          .toList(),
    );
  }
}

class BusDetail {
  final int studentTripId;
  final int tripId;
  final String round;
  final String area;
  final String startTime;
  final String endTime;
  final int seatNumber;
  final Driver driver;
  final Attendant attendant;

  BusDetail({
    required this.studentTripId,
    required this.tripId,
    required this.round,
    required this.area,
    required this.startTime,
    required this.endTime,
    required this.seatNumber,
    required this.driver,
    required this.attendant,
  });

  factory BusDetail.fromJson(Map<String, dynamic> json) {
    return BusDetail(
      studentTripId: json['student_trip_id'],
      tripId: json['trip_id'],
      round: json['round'],
      area: json['area'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      seatNumber: json['seat_number'],
      driver: Driver.fromJson(json['driver']),
      attendant: Attendant.fromJson(json['attendant']),
    );
  }
}

class Driver {
  final String nameAr;
  final String phone;

  Driver({required this.nameAr, required this.phone});

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      nameAr: json['name_ar'],
      phone: json['phone'],
    );
  }
}

class Attendant {
  final String nameAr;
  final String phone;

  Attendant({required this.nameAr, required this.phone});

  factory Attendant.fromJson(Map<String, dynamic> json) {
    return Attendant(
      nameAr: json['name_ar'],
      phone: json['phone'],
    );
  }
}
