// To parse this JSON data, do
//
//     final semesterDaysModel = semesterDaysModelFromJson(jsonString);

import 'dart:convert';

SemesterDaysModel semesterDaysModelFromJson(String str) => SemesterDaysModel.fromJson(json.decode(str));

String semesterDaysModelToJson(SemesterDaysModel data) => json.encode(data.toJson());

class SemesterDaysModel {
    bool? success;
    Data? data;

    SemesterDaysModel({
        this.success,
        this.data,
    });

    factory SemesterDaysModel.fromJson(Map<String, dynamic> json) => SemesterDaysModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    Student? student;
    School? school;
    Branch? branch;
    Semester? semester;

    Data({
        this.student,
        this.school,
        this.branch,
        this.semester,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        student: json["student"] == null ? null : Student.fromJson(json["student"]),
        school: json["school"] == null ? null : School.fromJson(json["school"]),
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        semester: json["semester"] == null ? null : Semester.fromJson(json["semester"]),
    );

    Map<String, dynamic> toJson() => {
        "student": student?.toJson(),
        "school": school?.toJson(),
        "branch": branch?.toJson(),
        "semester": semester?.toJson(),
    };
}

class Branch {
    int? id;
    String? nameAr;
    String? nameEn;
    String? location;
    String? address;
    String? phoneNumber;
    String? email;

    Branch({
        this.id,
        this.nameAr,
        this.nameEn,
        this.location,
        this.address,
        this.phoneNumber,
        this.email,
    });

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        location: json["location"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "location": location,
        "address": address,
        "phone_number": phoneNumber,
        "email": email,
    };
}

class School {
    int? id;
    String? nameAr;
    String? nameEn;
    String? phoneNumber;
    String? email;
    String? logo;

    School({
        this.id,
        this.nameAr,
        this.nameEn,
        this.phoneNumber,
        this.email,
        this.logo,
    });

    factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "phone_number": phoneNumber,
        "email": email,
        "logo": logo,
    };
}

class Semester {
    DateTime? startDate;
    DateTime? endDate;
    int? offDays;

    Semester({
        this.startDate,
        this.endDate,
        this.offDays,
    });

    factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        offDays: json["off_days"],
    );

    Map<String, dynamic> toJson() => {
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "off_days": offDays,
    };
}

class Student {
    int? id;
    String? name;

    Student({
        this.id,
        this.name,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
