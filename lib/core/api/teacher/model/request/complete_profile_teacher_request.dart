class CompletProfileTeacherRequest {
  String? email;
  String? address;
  String? birthDate;
  String? aiName;

  CompletProfileTeacherRequest(
      {this.email, this.address, this.birthDate, this.aiName});

  CompletProfileTeacherRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    address = json['address'];
    birthDate = json['birth_date'];
    aiName = json['ai_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['address'] = this.address;
    data['birth_date'] = this.birthDate;
    data['ai_name'] = this.aiName;
    return data;
  }
}