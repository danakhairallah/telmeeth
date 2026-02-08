class AttendanceData {
  int? studentId;
  String? name;
  int? totalDays;
  int? absencesCount;
  int? attendedDays;
  int? attendancePercentage;
  List<AbsenceDetails>? absenceDetails;

  AttendanceData(
      {this.studentId,
      this.name,
      this.totalDays,
      this.absencesCount,
      this.attendedDays,
      this.attendancePercentage,
      this.absenceDetails});

  AttendanceData.fromJson(Map<String, dynamic> json) {
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
  String? lessonName;
  int? teacherId;
  Null? teacherName;
  int? isExcused;
  String? notes;
  String? date;

  AbsenceDetails(
      {this.id,
      this.lessonId,
      this.lessonName,
      this.teacherId,
      this.teacherName,
      this.isExcused,
      this.notes,
      this.date});

  AbsenceDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonId = json['lesson_id'];
    lessonName = json['lesson_name'];
    teacherId = json['teacher_id'];
    teacherName = json['teacher_name'];
    isExcused = json['is_excused'];
    notes = json['notes'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lesson_id'] = this.lessonId;
    data['lesson_name'] = this.lessonName;
    data['teacher_id'] = this.teacherId;
    data['teacher_name'] = this.teacherName;
    data['is_excused'] = this.isExcused;
    data['notes'] = this.notes;
    data['date'] = this.date;
    return data;
  }
}