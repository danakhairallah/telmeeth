class User {
  String? accessToken;
  int? id;
  String? name;
  String? userName;
  String? type;

  User({this.id, this.name, this.userName, this.type  , this.accessToken});

  User.fromJson(Map<String, dynamic> json , {String? token}) {
    accessToken: token ?? '';
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['type'] = this.type;
    return data;
  }
}