class StudentFileModel {
  final int id;
  final int studentId;
  final String? birthCertificate;
  final String? passport;
  final String? identityCard;
  final String? personalPhoto;
  final List<String>? vaccines;
  final List<String>? familyBook;
  final String? transferPaper;
  final String? lastCertifiedDegree;
  final String? diseaseFree;
  final List<String>? upload1;
  final List<String>? upload2;
  final List<String>? upload3;
  final String createdAt;
  final String updatedAt;

  StudentFileModel({
    required this.id,
    required this.studentId,
    this.birthCertificate,
    this.passport,
    this.identityCard,
    this.personalPhoto,
    this.vaccines,
    this.familyBook,
    this.transferPaper,
    this.lastCertifiedDegree,
    this.diseaseFree,
    this.upload1,
    this.upload2,
    this.upload3,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentFileModel.fromJson(Map<String, dynamic> json) {
    return StudentFileModel(
      id: json['id'],
      studentId: json['student_id'],
      birthCertificate: json['birth_certificate'],
      passport: json['passport'],
      identityCard: json['identity_card'],
      personalPhoto: json['personal_photo'],
      vaccines: (json['vaccines'] as List?)?.map((e) => e.toString()).toList(),
      familyBook: (json['family_book'] as List?)?.map((e) => e.toString()).toList(),
      transferPaper: json['transfer_paper'],
      lastCertifiedDegree: json['last_certified_degree'],
      diseaseFree: json['disease_free'],
      upload1: (json['upload_1'] as List?)?.map((e) => e.toString()).toList(),
      upload2: (json['upload_2'] as List?)?.map((e) => e.toString()).toList(),
      upload3: (json['upload_3'] as List?)?.map((e) => e.toString()).toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
