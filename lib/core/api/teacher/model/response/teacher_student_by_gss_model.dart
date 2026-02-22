// To parse this JSON data, do
//
//     final teacherStudentByGssModel = teacherStudentByGssModelFromJson(jsonString);

import 'dart:convert';

TeacherStudentByGssModel teacherStudentByGssModelFromJson(String str) => TeacherStudentByGssModel.fromJson(json.decode(str));

String teacherStudentByGssModelToJson(TeacherStudentByGssModel data) => json.encode(data.toJson());

class TeacherStudentByGssModel {
    bool? success;
    List<Student>? students;

    TeacherStudentByGssModel({
        this.success,
        this.students,
    });

    factory TeacherStudentByGssModel.fromJson(Map<String, dynamic> json) => TeacherStudentByGssModel(
        success: json["success"],
        students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
    };
}

class Student {
    int? id;
    String? nameAr;
    String? nameEn;
    String? userName;
    Gender? gender;
    String? phoneNumber;
    DateTime? birthDate;
    Nationality? nationality;
    String? password;
    String? email;
    dynamic imagePath;
    dynamic imageUrl;
    String? aiName;
    Transportation? transportation;
    int? parentId;
    int? branchId;
    int? gradeSectionId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Student({
        this.id,
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
        this.transportation,
        this.parentId,
        this.branchId,
        this.gradeSectionId,
        this.createdAt,
        this.updatedAt,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        userName: json["user_name"],
        gender: genderValues.map[json["gender"]]!,
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        nationality: nationalityValues.map[json["nationality"]]!,
        password: json["password"],
        email: json["email"],
        imagePath: json["image_path"],
        imageUrl: json["image_url"],
        aiName: json["ai_name"],
        transportation: transportationValues.map[json["transportation"]]!,
        parentId: json["parent_id"],
        branchId: json["branch_id"],
        gradeSectionId: json["grade_section_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "user_name": userName,
        "gender": genderValues.reverse[gender],
        "phone_number": phoneNumber,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "nationality": nationalityValues.reverse[nationality],
        "password": password,
        "email": email,
        "image_path": imagePath,
        "image_url": imageUrl,
        "ai_name": aiName,
        "transportation": transportationValues.reverse[transportation],
        "parent_id": parentId,
        "branch_id": branchId,
        "grade_section_id": gradeSectionId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

enum Gender {
    FEMALE,
    MALE
}

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE
});

enum Nationality {
    JORDANIAN,
    NON_JORDANIAN
}

final nationalityValues = EnumValues({
    "Jordanian": Nationality.JORDANIAN,
    "Non-Jordanian": Nationality.NON_JORDANIAN
});

enum Transportation {
    WAITING,
    WALKING
}

final transportationValues = EnumValues({
    "waiting": Transportation.WAITING,
    "walking": Transportation.WALKING
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
