class StudentModel {
  final int id;
  final String nameAr;
  final String nameEn;

  StudentModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
    );
  }
}
