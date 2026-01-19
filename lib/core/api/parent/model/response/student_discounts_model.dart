class ParentStudentDiscountsResponse {
  final int? parentId;
  final String? parentName;
  final List<StudentDiscount>? students;

  ParentStudentDiscountsResponse({this.parentId, this.parentName, this.students});

  factory ParentStudentDiscountsResponse.fromJson(Map<String, dynamic> json) {
    return ParentStudentDiscountsResponse(
      parentId: json['parent_id'],
      parentName: json['parent_name'],
      students: json['students'] != null
          ? (json['students'] as List)
          .map((e) => StudentDiscount.fromJson(e))
          .toList()
          : [],
    );
  }
}

class StudentDiscount {
  final int? studentId;
  final String? studentName;
  final List<Discount>? discounts;

  StudentDiscount({this.studentId, this.studentName, this.discounts});

  factory StudentDiscount.fromJson(Map<String, dynamic> json) {
    return StudentDiscount(
      studentId: json['student_id'],
      studentName: json['student_name'],
      discounts: json['discounts'] != null
          ? (json['discounts'] as List)
          .map((e) => Discount.fromJson(e))
          .toList()
          : [],
    );
  }
}

// خصم واحد - يمكنك تعديله بناءً على البيانات الفعلية
class Discount {
  final int? id;
  final String? type;
  final double? amount;
  final String? note;

  Discount({this.id, this.type, this.amount, this.note});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json['id'],
      type: json['type'],
      amount: (json['amount'] != null) ? double.tryParse(json['amount'].toString()) : null,
      note: json['note'],
    );
  }
}
