import 'package:telmeeth/core/api/parent/model/response/fees_paid_model.dart';

class TotalFeesModel {
  bool? success;
  Student? student;
  Grade? grade;
  String? totalFees;

  TotalFeesModel({this.success, this.student, this.grade, this.totalFees});

  TotalFeesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    totalFees = json['total_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    data['total_fees'] = this.totalFees;
    return data;
  }
}

class Grade {
  int? id;
  String? nameAr;
  String? nameEn;

  Grade({this.id, this.nameAr, this.nameEn});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}