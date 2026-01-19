class MyChildrenModel {
  bool? success;
  List<Data>? data;

  MyChildrenModel({this.success, this.data});

  MyChildrenModel.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? gender;
  String? phoneNumber;
  String? birthDate;
  String? nationality;
  String? password;
  String? email;
  Null? imagePath;
  Null? imageUrl;
  String? aiName;
  String? transportaion;
  int? parentId;
  int? branchId;
  int? gradeSectionId;
  String? createdAt;
  String? updatedAt;
  GradeSection? gradeSection;

  Data(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.userName,
      this.gender,
      this.phoneNumber,
      this.birthDate,
      this.nationality,
      this.password,
      this.email,
      this.imagePath,
      this.imageUrl,
      this.aiName,
      this.transportaion,
      this.parentId,
      this.branchId,
      this.gradeSectionId,
      this.createdAt,
      this.updatedAt,
      this.gradeSection});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    userName = json['user_name'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    birthDate = json['birth_date'];
    nationality = json['nationality'];
    password = json['password'];
    email = json['email'];
    imagePath = json['image_path'];
    imageUrl = json['image_url'];
    aiName = json['ai_name'];
    transportaion = json['transportaion'];
    parentId = json['parent_id'];
    branchId = json['branch_id'];
    gradeSectionId = json['grade_section_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gradeSection = json['grade_section'] != null
        ? new GradeSection.fromJson(json['grade_section'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['user_name'] = this.userName;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['birth_date'] = this.birthDate;
    data['nationality'] = this.nationality;
    data['password'] = this.password;
    data['email'] = this.email;
    data['image_path'] = this.imagePath;
    data['image_url'] = this.imageUrl;
    data['ai_name'] = this.aiName;
    data['transportaion'] = this.transportaion;
    data['parent_id'] = this.parentId;
    data['branch_id'] = this.branchId;
    data['grade_section_id'] = this.gradeSectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.gradeSection != null) {
      data['grade_section'] = this.gradeSection!.toJson();
    }
    return data;
  }
}

class GradeSection {
  int? id;
  int? gradeId;
  int? sectionId;
  String? createdAt;
  String? updatedAt;
  Grade? grade;
  Section? section;

  GradeSection(
      {this.id,
      this.gradeId,
      this.sectionId,
      this.createdAt,
      this.updatedAt,
      this.grade,
      this.section});

  GradeSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gradeId = json['grade_id'];
    sectionId = json['section_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    section =
        json['section'] != null ? new Section.fromJson(json['section']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['grade_id'] = this.gradeId;
    data['section_id'] = this.sectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    return data;
  }
}

class Grade {
  int? id;
  String? nameAr;
  String? nameEn;
  String? level;
  String? createdAt;
  String? updatedAt;

  Grade(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.level,
      this.createdAt,
      this.updatedAt});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    level = json['level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['level'] = this.level;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Section {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  Section({this.id, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}