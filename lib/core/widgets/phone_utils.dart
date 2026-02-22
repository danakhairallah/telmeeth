class PhoneUtils {

  /// تنظيف الرقم من المسافات والرموز
  static String normalize(String number) {
    number = number.replaceAll(" ", "");

    if (number.startsWith("07")) {
      return number.substring(1);
    }

    if (number.startsWith("+962")) {
      return number.substring(4);
    }

    if (number.startsWith("962")) {
      return number.substring(3);
    }

    return number;
  }

  /// التحقق من صحة الرقم (صيغة السيرفر)
  static bool isValid(String number) {
    final regex = RegExp(r'^7\d{8}$');
    return regex.hasMatch(number);
  }
}
