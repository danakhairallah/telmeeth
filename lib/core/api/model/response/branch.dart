import 'package:telmeeth/core/api/model/response/school.dart';

class Branch {
  int? id;
  String? nameAr;
  String? nameEn;
  int? cityId;
  int? schoolId;
  String? phoneNumber;
  String? email;
  String? location;
  String? address;
  String? createdAt;
  String? updatedAt;
  School? school;

  Branch(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.cityId,
      this.schoolId,
      this.phoneNumber,
      this.email,
      this.location,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.school});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    schoolId = json['school_id'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    location = json['location'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['city_id'] = this.cityId;
    data['school_id'] = this.schoolId;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['location'] = this.location;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    return data;
  }
}