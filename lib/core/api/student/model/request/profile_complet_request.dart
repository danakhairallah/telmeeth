import 'dart:io';
import 'package:dio/dio.dart';

class ProfileCompletRequest {
  String nameAr;
  String nameEn;
  String gender;
  String phoneNumber;
  String birthDate;
  String nationality;
  String aiName;
  File? image; // الصورة اختيارية

  ProfileCompletRequest({
    required this.nameAr,
    required this.nameEn,
    required this.gender,
    required this.phoneNumber,
    required this.birthDate,
    required this.nationality,
    required this.aiName,
    this.image,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> formDataMap = {
      'name_ar': nameAr,
      'name_en': nameEn,
      'gender': gender,
      'phone_number': phoneNumber,
      'birth_date': birthDate,
      'nationality': nationality,
      'ai_name': aiName,
    };

    if (image != null) {
      formDataMap['image'] = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
      );
    }

    return FormData.fromMap(formDataMap);
  }
}

