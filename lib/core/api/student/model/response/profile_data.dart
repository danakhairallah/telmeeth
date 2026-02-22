
import 'package:telmeeth/core/api/student/model/response/branch.dart';
import 'package:telmeeth/core/api/student/model/response/grade_section.dart';

class ProfileData {
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
  Null imagePath;
  Null imageUrl;
  String? aiName;
  String? transportaion;
  int? parentId;
  int? branchId;
  int? gradeSectionId;
  String? createdAt;
  String? updatedAt;
  Branch? branch;
  GradeSection? gradeSection;

  ProfileData(
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
      this.branch,
      this.gradeSection});

  ProfileData.fromJson(Map<String, dynamic> json) {
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
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    gradeSection = json['grade_section'] != null
        ? GradeSection.fromJson(json['grade_section'])
        : null;
  }

  Null get phone => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['user_name'] = userName;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['birth_date'] = birthDate;
    data['nationality'] = nationality;
    data['password'] = password;
    data['email'] = email;
    data['image_path'] = imagePath;
    data['image_url'] = imageUrl;
    data['ai_name'] = aiName;
    data['transportaion'] = transportaion;
    data['parent_id'] = parentId;
    data['branch_id'] = branchId;
    data['grade_section_id'] = gradeSectionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    if (gradeSection != null) {
      data['grade_section'] = gradeSection!.toJson();
    }
    return data;
  }
}