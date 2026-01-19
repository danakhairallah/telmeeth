class SchoolModel {
  bool? success;
  List<Data>? data;

  SchoolModel({this.success, this.data});

  SchoolModel.fromJson(Map<String, dynamic> json) {
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
  String? nameAr;
  String? nameEn;
  int? maxBranches;
  int? maxTeachers;
  int? maxStudents;
  String? phoneNumber;
  String? altPhoneNumber;
  String? email;
  String? logo;
  int? curriculumId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.maxBranches,
      this.maxTeachers,
      this.maxStudents,
      this.phoneNumber,
      this.altPhoneNumber,
      this.email,
      this.logo,
      this.curriculumId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    maxBranches = json['max_branches'];
    maxTeachers = json['max_teachers'];
    maxStudents = json['max_students'];
    phoneNumber = json['phone_number'];
    altPhoneNumber = json['alt_phone_number'];
    email = json['email'];
    logo = json['logo'];
    curriculumId = json['curriculum_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['max_branches'] = this.maxBranches;
    data['max_teachers'] = this.maxTeachers;
    data['max_students'] = this.maxStudents;
    data['phone_number'] = this.phoneNumber;
    data['alt_phone_number'] = this.altPhoneNumber;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['curriculum_id'] = this.curriculumId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}