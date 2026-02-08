class TransferModel {
  bool? success;
  List<Data>? data;

  TransferModel({this.success, this.data});

  TransferModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? studentId;
  int? branchId;
  Null? schoolId;
  String? type;
  String? date;
  int? from;
  int? to;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.studentId,
      this.branchId,
      this.schoolId,
      this.type,
      this.date,
      this.from,
      this.to,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    branchId = json['branch_id'];
    schoolId = json['school_id'];
    type = json['type'];
    date = json['date'];
    from = json['from'];
    to = json['to'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['branch_id'] = this.branchId;
    data['school_id'] = this.schoolId;
    data['type'] = this.type;
    data['date'] = this.date;
    data['from'] = this.from;
    data['to'] = this.to;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}