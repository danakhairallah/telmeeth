
class AttendanceData {
  int? studentId;
  String? name;
  int? totalDays;
  int? absencesCount;
  int? attendedDays;
  int? attendancePercentage;
  List<AbsenceDetail>? absenceDetails;

  AttendanceData({
    this.studentId,
    this.name,
    this.totalDays,
    this.absencesCount,
    this.attendedDays,
    this.attendancePercentage,
    this.absenceDetails,
  });

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      studentId: json['student_id'],
      name: json['name'],
      totalDays: json['total_days'],
      absencesCount: json['absences_count'],
      attendedDays: json['attended_days'],
      attendancePercentage: json['attendance_percentage'],
      absenceDetails: json['absence_details'] != null
          ? List<AbsenceDetail>.from(
              json['absence_details'].map((x) => AbsenceDetail.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'name': name,
      'total_days': totalDays,
      'absences_count': absencesCount,
      'attended_days': attendedDays,
      'attendance_percentage': attendancePercentage,
      'absence_details':
          absenceDetails != null ? absenceDetails!.map((x) => x.toJson()).toList() : [],
    };
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
