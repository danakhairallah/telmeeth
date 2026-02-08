// validators.dart

String? validateUserName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your userName';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your password';
  }
  if (value.trim().length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your phone number';
  }
  if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null;
}

String? validateAddress(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your address';
  }
  return null;
}
