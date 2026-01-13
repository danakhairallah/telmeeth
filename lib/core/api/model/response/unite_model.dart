class UnitsModel {
  String? classId;
  List<Units>? units;

  UnitsModel({this.classId, this.units});

  UnitsModel.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(new Units.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_id'] = this.classId;
    if (this.units != null) {
      data['units'] = this.units!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Units {
  int? id;
  String? name;
  String? semester;

  Units({this.id, this.name, this.semester});

  Units.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    semester = json['semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['semester'] = this.semester;
    return data;
  }
}