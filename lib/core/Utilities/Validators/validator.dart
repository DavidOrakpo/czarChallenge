import 'package:intl/intl.dart';

/// Handles validation and conversions of different objects in the app
class Validators {
  /// Converts a given DateTime object to a string in the format "Mon, 12 Jan"
  static String dateTimeToString(DateTime? dateTime) {
    if (dateTime != null) {
      final DateFormat format = DateFormat("EEE, d MMM");
      return format.format(dateTime);
    } else {
      return "";
    }
  }

  /// Converts a given DateTime object to a string in the format "1 PM"
  static String dateTimeToAMString(DateTime? dateTime) {
    if (dateTime != null) {
      final DateFormat format = DateFormat("h a");
      return format.format(dateTime);
    } else {
      return "";
    }
  }

  /// Converts a given DateTime object to a string in the format "Wednesday"
  static String dateTimeToWeekDay(DateTime? dateTime) {
    if (dateTime != null) {
      final DateFormat format = DateFormat("EEEE");
      return format.format(dateTime);
    } else {
      return "";
    }
  }

  static String? validatePhone(String? phone,
      {String label = 'Phone number', bool withCountryCode = false}) {
    if (phone == null || phone.trim() == '') {
      return '$label is required...';
    }
    if (phone.length != 11 && !withCountryCode) {
      return '$label must be 11 digits';
    }
    phone = phone.trim();
    if (withCountryCode) {
      if (RegExp('[^0-9\+]').hasMatch(phone)) {
        return 'Only plus(+) & numbers are allowed.';
      }
      var pattern = r'^\+([0-9]{1,4}[0-9]{5,})$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(phone)) {
        return 'Enter a valid $label, with country code. e.g +44 712...';
      }
    } else {
      if (RegExp('^[+]').hasMatch(phone)) {
        return 'Enter phone number without country code.';
      }
      if (RegExp('[^0-9]').hasMatch(phone)) {
        return 'Only numbers are allowed.';
      }
      var pattern = r'^([0-9]{6,})$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(phone)) {
        return 'Enter a valid $label, without country code. e.g 712 123...';
      }
    }

    return null;
  }

  static String? isPasswordCompliant(String? password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    // bool hasSpecialCharacters =
    //     password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return (hasDigits & hasUppercase & hasLowercase & hasMinLength)
        ? null
        : 'Password must meet the rules';
  }

  static String? validatePassword(String? password) {
    if (password == null || password == '') {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Use 6 characters or more for password';
    } else if (['password', 'Password', '12345', '123456', '12345678']
        .contains(password)) {
      return 'Use a more secure (strong) password';
    }

    return null;
  }

  static String? validatePasswordConfirmation(
      String? password, String? confirmation) {
    if (validatePassword(password) == null && password != confirmation) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateNonEmpty(String? text) {
    if (text == null || text.trim() == "") {
      return "Field cannot be empty";
    }
    return null;
  }

  static String? validateUsername(String? username) {
    if (username == null || username.trim() == '') {
      return 'Username is required';
    }
    username = username.trim();
    if (RegExp('[^a-zA-Z0-9_]').hasMatch(username)) {
      return 'Only letters, numbers, & underscores are allowed.';
    }
    var pattern = r'^(admin|administrator|sex|fuck|vagina|pussy)$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(username)) {
      return 'Enter a valid username';
    }
    if (RegExp(r'^(_)+$').hasMatch(username)) {
      return 'Username cannot be all underscores';
    }

    return null;
  }

  static String? validateNumber(String val, {String label = 'This'}) {
    if (val == null || val.trim() == '') {
      return '$label is required';
    }
    val = val.trim();
    if (RegExp('[^eE0-9\s,.\-]').hasMatch(val)) {
      return 'Only numbers are allowed.';
    }
    if (RegExp('(-){2, }').hasMatch(val)) {
      return '$label should only begin with and contain a single minus (-) sign.';
    }
    if (!RegExp('^(-){1}').hasMatch(val) && RegExp('(-)+').hasMatch(val)) {
      return '$label should only begin with and contain a single minus (-) sign.';
    }
    if (RegExp('^(-){1}').hasMatch(val) && RegExp('(-){2,}').hasMatch(val)) {
      return '$label should only begin with and contain a single minus (-) sign.';
    }

    return null;
  }

  static String? validatePositiveNumber(String val,
      {String label = 'This', bool required = true}) {
    if (required && (val == null || val.trim() == '')) {
      return '$label is required';
    }

    val = val.trim();

    if (RegExp('(-)+').hasMatch(val)) {
      return '$label should not contain a sign.';
    }
    if (RegExp('[^eE0-9\s,.]').hasMatch(val)) {
      return 'Only numbers are allowed.';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim() == '') {
      return 'Email is required';
    }
    email = email.trim();
    if (RegExp('[^a-zA-Z0-9.@\-]').hasMatch(email)) {
      return 'Only letters(A-Z), numbers(0-9), & periods(.) are allowed.';
    }
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      if (email.contains('@')) {
        String username = email.substring(0, email.indexOf('@'));
        if (username.endsWith('.')) {
          return 'Email $username cannot end with a period';
        }
      }
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validateLoginEmail(String? email) {
    if (email == null || email.trim() == '') {
      return 'Email is required';
    }
    if (validateEmail(email) != null) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validateLoginPassword(String? password) {
    if (password == null || password == '') {
      return 'Password is required';
    }

    return null;
  }

  static String? validateLoginUsername(String? username) {
    if (username == null || username.trim() == '') {
      return 'Username is required';
    }
    if (validateUsername(username) != null) {
      return 'Enter a valid username';
    }

    return null;
  }

  static String? validateRequired(String? value, String name,
      {int? minLength}) {
    if (value == null || value.trim() == '') {
      return '$name is required';
    }

    if (minLength != null && value.length < minLength) {
      return '$name requires at least $minLength characters';
    }

    return null;
  }

  static String? confirmPassword(String password, String value, String name) {
    if (validateRequired(value, name) != null) {
      return validateRequired(value, name);
    }
    if (password != value) {
      return '$name does not match';
    }

    return null;
  }
}
