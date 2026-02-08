class AttendanceTeacherRequest {
  int? studentId;
  int? lessonId;
  String? date;
  bool? isExcused;
  String? notes;

  AttendanceTeacherRequest(
      {this.studentId, this.lessonId, this.date, this.isExcused, this.notes});

  AttendanceTeacherRequest.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    lessonId = json['lesson_id'];
    date = json['date'];
    isExcused = json['is_excused'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['lesson_id'] = this.lessonId;
    data['date'] = this.date;
    data['is_excused'] = this.isExcused;
    data['notes'] = this.notes;
    return data;
  }
}