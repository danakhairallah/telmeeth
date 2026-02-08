class CompletProfileResponse {
  bool? success;
  String? message;
  Data? data;

  CompletProfileResponse({this.success, this.message, this.data});

  CompletProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? imageUrl;
  String? aiName;
  String? transportaion;
  int? parentId;
  int? branchId;
  int? gradeSectionId;
  String? createdAt;
  String? updatedAt;

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
      this.updatedAt});

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
    return data;
  }
}