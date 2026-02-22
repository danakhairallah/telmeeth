import 'package:dio/dio.dart';
import '../model/response/student_model.dart';

class StudentService {
  final Dio dio;
  StudentService(this.dio);

  Future<List<StudentModel>> getMyStudents() async {
    final res = await dio.get('/parent/my-students');
    final data = res.data['data'] as List;
    return data.map((e) => StudentModel.fromJson(e)).toList();
  }
}
