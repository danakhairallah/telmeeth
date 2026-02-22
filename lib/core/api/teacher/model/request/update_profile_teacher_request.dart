import 'dart:io';
import 'package:dio/dio.dart';

class UpdateProfileTeacherRequest {
  String? nameAr;
  String? nameEn;
  String? phoneNumber;
  File? image;

  UpdateProfileTeacherRequest({
    this.nameAr,
    this.nameEn,
    this.phoneNumber,
    this.image,
  });
  
  FormData toFormData() {
    return FormData.fromMap({
      "name_ar": nameAr,
      "name_en": nameEn,
      "phone_number": phoneNumber,
      if (image != null)
        "image": MultipartFile.fromFileSync(
          image!.path,
          filename: image!.path.split('/').last,
        ),
    });
  }
}
