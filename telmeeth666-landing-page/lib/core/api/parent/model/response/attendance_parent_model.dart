class AttendanceParentModel {
  bool? success;
  ParentAttendance? parentAttendance;

  AttendanceParentModel({this.success, this.parentAttendance});

  AttendanceParentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    parentAttendance = json['data'] != null ? new ParentAttendance.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.parentAttendance != null) {
      data['data'] = this.parentAttendance!.toJson();
    }
    return data;
  }
}

class ParentAttendance {
  int? studentId;
  String? name;
  int? totalDays;
  int? absencesCount;
  int? attendedDays;
  int? attendancePercentage;
  List<AbsenceDetails>? absenceDetails;

  ParentAttendance(
      {this.studentId,
      this.name,
      this.totalDays,
      this.absencesCount,
      this.attendedDays,
      this.attendancePercentage,
      this.absenceDetails});

  ParentAttendance.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    name = json['name'];
    totalDays = json['total_days'];
    absencesCount = json['absences_count'];
    attendedDays = json['attended_days'];
    attendancePercentage = json['attendance_percentage'];
    if (json['absence_details'] != null) {
      absenceDetails = <AbsenceDetails>[];
      json['absence_details'].forEach((v) {
        absenceDetails!.add(new AbsenceDetails.fromJson(v));
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

class AbsenceDetails {
  int? id;
  int? lessonId;
  int? teacherId;
  int? isExcused;
  String? notes;
  String? date;

  AbsenceDetails(
      {this.id,
      this.lessonId,
      this.teacherId,
      this.isExcused,
      this.notes,
      this.date});

  AbsenceDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonId = json['lesson_id'];
    teacherId = json['teacher_id'];
    isExcused = json['is_excused'];
    notes = json['notes'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lesson_id'] = this.lessonId;
    data['teacher_id'] = this.teacherId;
    data['is_excused'] = this.isExcused;
    data['notes'] = this.notes;
    data['date'] = this.date;
    return data;
  }
}