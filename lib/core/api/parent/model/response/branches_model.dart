class BranchesModel {
  bool? success;
  List<Data>? data;

  BranchesModel({this.success, this.data});

  BranchesModel.fromJson(Map<String, dynamic> json) {
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
  int? cityId;
  int? schoolId;
  String? phoneNumber;
  String? email;
  String? location;
  String? address;
  String? createdAt;
  String? updatedAt;

  Data(
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
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}