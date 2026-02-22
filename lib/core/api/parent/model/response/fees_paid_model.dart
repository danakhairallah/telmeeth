class FeesPaidModel {
  bool? success;
  Student? student;
  List<Payments>? payments;

  FeesPaidModel({this.success, this.student, this.payments});

  FeesPaidModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;

    if (json['data'] != null) {
      payments = <Payments>[];
      json['data'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Student {
  int? id;
  String? nameAr;

  Student({this.id, this.nameAr});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    return data;
  }
}

class Payments {
  int? id;
  String? amount;
  String? paymentDate;
  String? paymentMethod;

  Payments({this.id, this.amount, this.paymentDate, this.paymentMethod});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    paymentDate = json['payment_date'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['payment_date'] = this.paymentDate;
    data['payment_method'] = this.paymentMethod;
    return data;
  }
}