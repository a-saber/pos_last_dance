class MyFormValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?\d{9,15}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  static String? validateRequired(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength, {String fieldName = 'Field'}) {
    if (value == null || value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    return null;
  }

  static String? validateMatch(String? value1, String? value2, {String fieldName = 'Fields'}) {
    if (value1 != value2) {
      return '$fieldName do not match';
    }
    return null;
  }
  static String? validateInteger(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is required';
    }
    final integerRegex = RegExp(r'^\d+$');
    if (!integerRegex.hasMatch(value.trim())) {
      return 'Enter a valid integer';
    }
    return null;
  }
}
