class BusDetailsModel {
  bool? status;
  int? count;
  List<BusData>? data;

  BusDetailsModel({this.status, this.count, this.data});

  BusDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = <BusData>[];
      json['data'].forEach((v) {
        data!.add(new BusData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusData {
  int? studentTripId;
  int? tripId;
  String? round;
  String? area;
  String? startTime;
  String? endTime;
  int? seatNumber;
  Driver? driver;
  Driver? attendant;

  BusData(
      {this.studentTripId,
      this.tripId,
      this.round,
      this.area,
      this.startTime,
      this.endTime,
      this.seatNumber,
      this.driver,
      this.attendant});

  BusData.fromJson(Map<String, dynamic> json) {
    studentTripId = json['student_trip_id'];
    tripId = json['trip_id'];
    round = json['round'];
    area = json['area'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    seatNumber = json['seat_number'];
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    attendant = json['attendant'] != null
        ? new Driver.fromJson(json['attendant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_trip_id'] = this.studentTripId;
    data['trip_id'] = this.tripId;
    data['round'] = this.round;
    data['area'] = this.area;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['seat_number'] = this.seatNumber;
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    if (this.attendant != null) {
      data['attendant'] = this.attendant!.toJson();
    }
    return data;
  }
}

class Driver {
  String? nameAr;
  String? phone;

  Driver({this.nameAr, this.phone});

  Driver.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_ar'] = this.nameAr;
    data['phone'] = this.phone;
    return data;
  }
}