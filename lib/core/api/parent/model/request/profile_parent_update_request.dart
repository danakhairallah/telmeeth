
class ProfileParentUpdateRequest {
  String? email;
  String? address;
  String? location;
  String? alternateNumber;

  ProfileParentUpdateRequest(
      {this.email, this.address, this.location, this.alternateNumber});

  ProfileParentUpdateRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    address = json['address'];
    location = json['location'];
    alternateNumber = json['alternate_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['address'] = this.address;
    data['location'] = this.location;
    data['alternate_number'] = this.alternateNumber;
    return data;
  }
}