class SchoolDaysModel {
  bool? status;
  SchoolDaysData? data;

  SchoolDaysModel({this.status, this.data});

  SchoolDaysModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new SchoolDaysData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SchoolDaysData {
  List<String>? weeklyOffDays;
  List<String>? semesterOffDays;
  List<String>? workingDays;
  int? allowedAbsences;
  int? allowedLates;
  String? startTime;
  String? endTime;

  SchoolDaysData(
      {this.weeklyOffDays,
      this.semesterOffDays,
      this.workingDays,
      this.allowedAbsences,
      this.allowedLates,
      this.startTime,
      this.endTime});

  SchoolDaysData.fromJson(Map<String, dynamic> json) {
    weeklyOffDays = json['weekly_off_days'].cast<String>();
    semesterOffDays = json['semester_off_days'].cast<String>();
    workingDays = json['working_days'].cast<String>();
    allowedAbsences = json['allowed_absences'];
    allowedLates = json['allowed_lates'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weekly_off_days'] = this.weeklyOffDays;
    data['semester_off_days'] = this.semesterOffDays;
    data['working_days'] = this.workingDays;
    data['allowed_absences'] = this.allowedAbsences;
    data['allowed_lates'] = this.allowedLates;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}