
import 'dart:convert';

BusTrackingModel busTrackingModelFromJson(String str) => BusTrackingModel.fromJson(json.decode(str));

String busTrackingModelToJson(BusTrackingModel data) => json.encode(data.toJson());

class BusTrackingModel {
    String? message;
    OrsResponse? orsResponse;

    BusTrackingModel({
        this.message,
        this.orsResponse,
    });

    factory BusTrackingModel.fromJson(Map<String, dynamic> json) => BusTrackingModel(
        message: json["message"],
        orsResponse: json["ors_response"] == null ? null : OrsResponse.fromJson(json["ors_response"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "ors_response": orsResponse?.toJson(),
    };
}

class OrsResponse {
    Error? error;
    Info? info;

    OrsResponse({
        this.error,
        this.info,
    });

    factory OrsResponse.fromJson(Map<String, dynamic> json) => OrsResponse(
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
        "info": info?.toJson(),
    };
}

class Error {
    int? code;
    String? message;

    Error({
        this.code,
        this.message,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
    };
}

class Info {
    Engine? engine;
    int? timestamp;

    Info({
        this.engine,
        this.timestamp,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        engine: json["engine"] == null ? null : Engine.fromJson(json["engine"]),
        timestamp: json["timestamp"],
    );

    Map<String, dynamic> toJson() => {
        "engine": engine?.toJson(),
        "timestamp": timestamp,
    };
}

class Engine {
    DateTime? buildDate;
    String? graphVersion;
    DateTime? graphDate;
    DateTime? osmDate;
    String? version;

    Engine({
        this.buildDate,
        this.graphVersion,
        this.graphDate,
        this.osmDate,
        this.version,
    });

    factory Engine.fromJson(Map<String, dynamic> json) => Engine(
        buildDate: json["build_date"] == null ? null : DateTime.parse(json["build_date"]),
        graphVersion: json["graph_version"],
        graphDate: json["graph_date"] == null ? null : DateTime.parse(json["graph_date"]),
        osmDate: json["osm_date"] == null ? null : DateTime.parse(json["osm_date"]),
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "build_date": buildDate?.toIso8601String(),
        "graph_version": graphVersion,
        "graph_date": graphDate?.toIso8601String(),
        "osm_date": osmDate?.toIso8601String(),
        "version": version,
    };
}
