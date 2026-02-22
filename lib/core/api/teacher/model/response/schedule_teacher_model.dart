class ScheduleTeacherModel {
  bool? success;
  List<ScheduleData>? scheduleData;

  ScheduleTeacherModel({this.success, this.scheduleData});

  ScheduleTeacherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      scheduleData = <ScheduleData>[];
      json['data'].forEach((v) {
        scheduleData!.add(new ScheduleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.scheduleData != null) {
      data['data'] = this.scheduleData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleData {
  int? id;
  int? teacherId;
  String? dateTime;
  String? title;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  ScheduleData(
      {this.id,
      this.teacherId,
      this.dateTime,
      this.title,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    dateTime = json['date_time'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['date_time'] = this.dateTime;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}