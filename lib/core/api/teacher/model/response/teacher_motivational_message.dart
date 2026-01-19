class MotivationMessageTeacher {
  final int id;
  final int studentId;
  final int classTeacherId;
  final String message;
  final String? imagePath;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Student? student;
  final ClassTeacher? classTeacher;

  MotivationMessageTeacher({
    required this.id,
    required this.studentId,
    required this.classTeacherId,
    required this.message,
    this.imagePath,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.student,
    this.classTeacher,
  });

  factory MotivationMessageTeacher.fromJson(Map<String, dynamic> json) {
    return MotivationMessageTeacher(
      id: json['id'],
      studentId: int.parse(json['student_id'].toString()),
      classTeacherId: int.parse(json['class_teacher_id'].toString()),
      message: json['message'],
      imagePath: json['image_path'],
      imageUrl: json['image_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      student: json['student'] != null ? Student.fromJson(json['student']) : null,
      classTeacher: json['class_teacher'] != null ? ClassTeacher.fromJson(json['class_teacher']) : null,
    );
  }
}

// نموذج الطالب (Student)
class Student {
  final int id;
  final String nameAr;
  final String nameEn;
  final String userName;
  final String gender;
  final String phoneNumber;
  final String birthDate;
  final String nationality;
  final String? imagePath;
  final String? imageUrl;
  // أضف المزيد إذا أردت (حسب الحاجة)

  Student({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.userName,
    required this.gender,
    required this.phoneNumber,
    required this.birthDate,
    required this.nationality,
    this.imagePath,
    this.imageUrl,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      userName: json['user_name'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      birthDate: json['birth_date'],
      nationality: json['nationality'],
      imagePath: json['image_path'],
      imageUrl: json['image_url'],
    );
  }
}

// نموذج المعلم (ClassTeacher)
class ClassTeacher {
  final int id;
  final int classId;
  final int teacherId;
  final int sectionId;
  final String day;
  final String classTime;

  ClassTeacher({
    required this.id,
    required this.classId,
    required this.teacherId,
    required this.sectionId,
    required this.day,
    required this.classTime,
  });

  factory ClassTeacher.fromJson(Map<String, dynamic> json) {
    return ClassTeacher(
      id: json['id'],
      classId: json['class_id'],
      teacherId: json['teacher_id'],
      sectionId: json['section_id'],
      day: json['day'],
      classTime: json['class_time'],
    );
  }
}
