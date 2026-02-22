
import 'package:telmeeth/core/api/student/model/response/school.dart';

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
    json['school'] != null ? School.fromJson(json['school']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['city_id'] = cityId;
    data['school_id'] = schoolId;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['location'] = location;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (school != null) {
      data['school'] = school!.toJson();
    }
    return data;
  }
}