class KValidations{
  // Function to validate an email address
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }

    final emailRegExp = RegExp(r'^\w+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null; // Return null if validation succeeds
  }

// Function to validate a password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 5) {
      return 'Password must be at least 5 characters long';
    }

    if (!value.contains(RegExp(r'\d'))) {
      return 'Password must contain at least one digit';
    }

    return null; // Return null if validation succeeds
  }
}