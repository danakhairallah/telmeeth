class School {
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

  School(
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

  School.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['max_branches'] = maxBranches;
    data['max_teachers'] = maxTeachers;
    data['max_students'] = maxStudents;
    data['phone_number'] = phoneNumber;
    data['alt_phone_number'] = altPhoneNumber;
    data['email'] = email;
    data['logo'] = logo;
    data['curriculum_id'] = curriculumId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}