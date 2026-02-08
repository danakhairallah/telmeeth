class ParentAttendance {
  bool? success;
  Data? data;

  ParentAttendance({this.success, this.data});

  ParentAttendance.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? studentId;
  String? name;
  int? totalDays;
  int? absencesCount;
  int? attendedDays;
  int? attendancePercentage;
  List<AbsenceDetail>? absenceDetails;

  Data(
      {this.studentId,
      this.name,
      this.totalDays,
      this.absencesCount,
      this.attendedDays,
      this.attendancePercentage,
      this.absenceDetails});

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    name = json['name'];
    totalDays = json['total_days'];
    absencesCount = json['absences_count'];
    attendedDays = json['attended_days'];
    attendancePercentage = json['attendance_percentage'];
    if (json['absence_details'] != null) {
      absenceDetails = <AbsenceDetail>[];
      json['absence_details'].forEach((v) {
        absenceDetails!.add(new AbsenceDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['name'] = this.name;
    data['total_days'] = this.totalDays;
    data['absences_count'] = this.absencesCount;
    data['attended_days'] = this.attendedDays;
    data['attendance_percentage'] = this.attendancePercentage;
    if (this.absenceDetails != null) {
      data['absence_details'] =
          this.absenceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AbsenceDetail {
  // حطي الحقول حسب الـ API لو صار فيه عناصر مستقبلاً
  AbsenceDetail();

  factory AbsenceDetail.fromJson(Map<String, dynamic> json) {
    return AbsenceDetail();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}