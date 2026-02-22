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

class Discount {
  final String? discountName;
  final double? percentage;
  final double? originalAmount;
  final double? finalAmount;

  Discount({
    this.discountName,
    this.percentage,
    this.originalAmount,
    this.finalAmount,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      discountName: json['discount_name'],
      percentage: json['percentage'] != null
          ? double.tryParse(json['percentage'].toString())
          : null,
      originalAmount: json['original_amount'] != null
          ? double.tryParse(json['original_amount'].toString())
          : null,
      finalAmount: json['final_amount'] != null
          ? double.tryParse(json['final_amount'].toString())
          : null,
    );
  }
}
