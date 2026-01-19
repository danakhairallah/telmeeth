class UpdateProfileRequest {
  String? password;
  String? passwordConfirmation;
  String? aiName;

  UpdateProfileRequest({
    this.password,
    this.passwordConfirmation,
    this.aiName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (password != null && password!.isNotEmpty) {
      data['password'] = password;
    }

    if (passwordConfirmation != null && passwordConfirmation!.isNotEmpty) {
      data['password_confirmation'] = passwordConfirmation;
    }

    if (aiName != null && aiName!.isNotEmpty) {
      data['ai_name'] = aiName;
    }

    return data;
  }
}
