class Auth {
  bool? success;
  String? message;
  AuthData? data;

  Auth({this.success, this.message, this.data});

  Auth.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new AuthData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AuthData {
  String? token;
  User? user;

  AuthData({this.token, this.user});

  AuthData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? accessToken;
  int? id;
  String? name;
  String? userName;
  dynamic type; // لاحظ: dynamic مش String

  User({this.id, this.name, this.userName, this.type, this.accessToken});

  User.fromJson(Map<String, dynamic> json, {String? token}) {
    accessToken = token;
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    type = json['type']; // قد تكون String أو List
  }

  // Getter ليرجع الدور الصحيح
  String? get role {
    if (type is List && type != null && (type as List).isNotEmpty) {
      return (type as List).first.toString().toLowerCase();
    } else if (type is String && type != null && (type as String).isNotEmpty) {
      return (type as String).toLowerCase();
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['type'] = this.type;
    return data;
  }
}
