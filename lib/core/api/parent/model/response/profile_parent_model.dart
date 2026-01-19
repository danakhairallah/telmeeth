class ProfileParentModel {
  bool? success;
  Data? data;

  ProfileParentModel({this.success, this.data});

  ProfileParentModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? userName;
  String? phoneNumber;
  String? plateNumber;
  String? carColor;
  String? alternateNumber;
  String? password;
  String? email;
  String? address;
  String? location;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userName,
      this.phoneNumber,
      this.plateNumber,
      this.carColor,
      this.alternateNumber,
      this.password,
      this.email,
      this.address,
      this.location,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    phoneNumber = json['phone_number'];
    plateNumber = json['plate_number'];
    carColor = json['car_color'];
    alternateNumber = json['alternate_number'];
    password = json['password'];
    email = json['email'];
    address = json['address'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['phone_number'] = this.phoneNumber;
    data['plate_number'] = this.plateNumber;
    data['car_color'] = this.carColor;
    data['alternate_number'] = this.alternateNumber;
    data['password'] = this.password;
    data['email'] = this.email;
    data['address'] = this.address;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}