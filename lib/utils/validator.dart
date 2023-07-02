class Validator {
  Validator._();

  static String? validateFullName(String? value) {
    // Remove leading and trailing white spaces
    value = value!.trim();

    // Check if the full name consists of at least two parts
    List<String> nameParts = value.split(' ');
    if (nameParts.length < 2) {
      return 'Please enter a valid full name';
    }

    return null; // Return null if the full name is valid
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required.';
    }

    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]+$');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required.';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // You can add more specific password validation rules here

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    // Regular expression pattern for phone numbers (assumes 10 digits)
    final RegExp regex = RegExp(r'^[0-9]{11}$');

    if (!regex.hasMatch(value!)) {
      return 'Please enter a valid 11-digit phone number';
    }

    return null; // Return null if the phone number is valid
  }
}
