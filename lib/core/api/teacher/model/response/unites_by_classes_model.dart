
import 'dart:convert';

UnitsByClassesModel unitsByClassesModelFromJson(String str) => UnitsByClassesModel.fromJson(json.decode(str));

String unitsByClassesModelToJson(UnitsByClassesModel data) => json.encode(data.toJson());

class UnitsByClassesModel {
    bool? success;
    List<Unit>? units;

    UnitsByClassesModel({
        this.success,
        this.units,
    });

    factory UnitsByClassesModel.fromJson(Map<String, dynamic> json) => UnitsByClassesModel(
        success: json["success"],
        units: json["units"] == null ? [] : List<Unit>.from(json["units"]!.map((x) => Unit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "units": units == null ? [] : List<dynamic>.from(units!.map((x) => x.toJson())),
    };
}

class Unit {
    int? id;
    String? name;
    String? semester;

    Unit({
        this.id,
        this.name,
        this.semester,
    });

    factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        semester: json["semester"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "semester": semester,
    };
}
