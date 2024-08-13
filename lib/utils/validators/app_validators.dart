import 'package:validators/validators.dart' as validators;

class AppValidators {
  // * message Error
  static const String messageEnterValue = "Please enter a value";
  static const String messageCorrectEmail =
      "please write an email address by way correct.";
  static const String messageCorrectPass =
      "A password of no less than 6 characters and no more than 12.";
  static const String messageConfirmPass =
      "Your password and confirmation password don't match.";

  static String? isUserName(String? value) => templateValidator(
      value, !validators.isLength(value ?? '', 4, 100), messageCorrectPass);
  static String? checkPass(String? value) => templateValidator(
      value, !validators.isLength(value ?? '', 4, 100), messageCorrectPass);

  static String? checkConfirmPass(String? value, String? pass) =>
      templateValidator(
          value, !validators.equals(value?.trim(), pass), messageConfirmPass);

  // * validator
  static String? templateValidator(
      String? value, bool condition, String errorMsg) {
    if (value?.isEmpty ?? true) {
      return messageEnterValue;
    } else if (condition) {
      return errorMsg;
    }
    return null;
  }
}
