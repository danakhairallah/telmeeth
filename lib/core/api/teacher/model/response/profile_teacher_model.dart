class ProfileTeacherModel {
  bool? success;
  Data? data;

  ProfileTeacherModel({this.success, this.data});

  ProfileTeacherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  TeacherProfile? teacherProfile;
  List<Classes>? classes;

  Data({this.teacherProfile, this.classes});

  Data.fromJson(Map<String, dynamic> json) {
    teacherProfile =
        json['teacher'] != null ? new TeacherProfile.fromJson(json['teacher']) : null;
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacherProfile != null) {
      data['teacher'] = this.teacherProfile!.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeacherProfile {
  int? id;
  String? nameAr;
  String? nameEn;
  String? userName;
  String? gender;
  String? phoneNumber;
  String? nationality;
  String? password;
  String? birthDate;
  String? address;
  String? email;
  Null? aiName;
  Null? imagePath;
  Null? imageUrl;
  int? branchId;
  List<String>? types;
  String? createdAt;
  String? updatedAt;

  TeacherProfile(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.userName,
      this.gender,
      this.phoneNumber,
      this.nationality,
      this.password,
      this.birthDate,
      this.address,
      this.email,
      this.aiName,
      this.imagePath,
      this.imageUrl,
      this.branchId,
      this.types,
      this.createdAt,
      this.updatedAt});

  TeacherProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    userName = json['user_name'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    nationality = json['nationality'];
    password = json['password'];
    birthDate = json['birth_date'];
    address = json['address'];
    email = json['email'];
    aiName = json['ai_name'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    branchId = json['branch_id'];
    types = json['types'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['user_name'] = this.userName;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['nationality'] = this.nationality;
    data['password'] = this.password;
    data['birth_date'] = this.birthDate;
    data['address'] = this.address;
    data['email'] = this.email;
    data['ai_name'] = this.aiName;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['branch_id'] = this.branchId;
    data['types'] = this.types;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Classes {
  String? gradeName;
  String? sectionName;
  String? subjectName;
  String? day;
  String? classTime;

  Classes(
      {this.gradeName,
      this.sectionName,
      this.subjectName,
      this.day,
      this.classTime});

  Classes.fromJson(Map<String, dynamic> json) {
    gradeName = json['grade_name'];
    sectionName = json['section_name'];
    subjectName = json['subject_name'];
    day = json['day'];
    classTime = json['class_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade_name'] = this.gradeName;
    data['section_name'] = this.sectionName;
    data['subject_name'] = this.subjectName;
    data['day'] = this.day;
    data['class_time'] = this.classTime;
    return data;
  }
}