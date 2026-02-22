import 'package:telmeeth/core/api/parent/model/response/fees_paid_model.dart';
import 'package:telmeeth/core/api/parent/model/response/total_fees_model.dart';

class RemainingFeesModel {
  bool? success;
  Student? student;
  Grade? grade;
  int? totalFees;
  int? paid;
  int? remaining;

  RemainingFeesModel({
    this.success,
    this.student,
    this.grade,
    this.totalFees,
    this.paid,
    this.remaining,
  });


  RemainingFeesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
    totalFees = json['total_fees'];
    paid = json['paid'];
    remaining = json['remaining'];
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
    data['paid'] = this.paid;
    data['remaining'] = this.remaining;
    return data;
  }
}
