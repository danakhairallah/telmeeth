class Grade {
  int? id;
  String? nameAr;
  String? nameEn;

  Grade({this.id, this.nameAr, this.nameEn});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    return data;
  }
}