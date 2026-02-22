
import 'dart:convert';

StudentTripsModel studentTripsModelFromJson(String str) => StudentTripsModel.fromJson(json.decode(str));

String studentTripsModelToJson(StudentTripsModel data) => json.encode(data.toJson());

class StudentTripsModel {
    bool? status;
    int? studentId;
    String? studentName;
    int? tripsCount;
    List<Trip>? trips;

    StudentTripsModel({
        this.status,
        this.studentId,
        this.studentName,
        this.tripsCount,
        this.trips,
    });

    factory StudentTripsModel.fromJson(Map<String, dynamic> json) => StudentTripsModel(
        status: json["status"],
        studentId: json["student_id"],
        studentName: json["student_name"],
        tripsCount: json["trips_count"],
        trips: json["trips"] == null ? [] : List<Trip>.from(json["trips"]!.map((x) => Trip.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "student_id": studentId,
        "student_name": studentName,
        "trips_count": tripsCount,
        "trips": trips == null ? [] : List<dynamic>.from(trips!.map((x) => x.toJson())),
    };
}

class Trip {
    int? studentTripId;
    int? tripId;
    String? round;
    String? area;
    String? startTime;
    String? endTime;
    int? seatNumber;
    Attendant? driver;
    Attendant? attendant;

    Trip({
        this.studentTripId,
        this.tripId,
        this.round,
        this.area,
        this.startTime,
        this.endTime,
        this.seatNumber,
        this.driver,
        this.attendant,
    });

    factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        studentTripId: json["student_trip_id"],
        tripId: json["trip_id"],
        round: json["round"],
        area: json["area"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        seatNumber: json["seat_number"],
        driver: json["driver"] == null ? null : Attendant.fromJson(json["driver"]),
        attendant: json["attendant"] == null ? null : Attendant.fromJson(json["attendant"]),
    );

    Map<String, dynamic> toJson() => {
        "student_trip_id": studentTripId,
        "trip_id": tripId,
        "round": round,
        "area": area,
        "start_time": startTime,
        "end_time": endTime,
        "seat_number": seatNumber,
        "driver": driver?.toJson(),
        "attendant": attendant?.toJson(),
    };
}

class Attendant {
    String? nameAr;
    String? phone;

    Attendant({
        this.nameAr,
        this.phone,
    });

    factory Attendant.fromJson(Map<String, dynamic> json) => Attendant(
        nameAr: json["name_ar"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "name_ar": nameAr,
        "phone": phone,
    };
}
