class LoginRequest {
  String? user_name;
  String? password;

  LoginRequest({required this.user_name, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = user_name;
    data['password'] = password;
    return data;
  }
}
