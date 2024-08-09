import 'package:validators/validators.dart' as validators;

class AppValidators {
  // * message Error
  static final String messageEnterValue = "Please enter a value";
  static final String messageCorrectEmail =
      "please write an email address by way correct.";
  static final String messageCorrectPass =
      "A password of no less than 6 characters and no more than 12.";
  static final String messageConfirmPass =
      "Your password and confirmation password don't match.";

  static String? isEmail(String? value) => templateValidator(
      value, !validators.isEmail(value ?? ''), messageCorrectEmail);

  static String? checkPass(String? value) => templateValidator(
      value, !validators.isLength(value ?? '', 6, 12), messageCorrectPass);

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
