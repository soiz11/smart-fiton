import 'package:flutter/foundation.dart';
import 'package:smart_fit_on/views/authentication/on_boarding.dart';

class FormValidators {
  static String? validateName(String? value, String any) {
    //validate name
    if (value == null || value.isEmpty) {
      return 'Please enter your $any name';
    }
    if (value.length < 2) {
      return 'First name must be at least 2 characters';
    }
    if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
      return 'Please enter only alphabetical characters';
    }
    return null;
  }

  //nic validation
  String? validateNIC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your NIC';
    }

    String pattern =
        r'^[0-9]{9}[vVxX]$'; // Adjust the regular expression pattern based on your country's NIC format
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid NIC';
    }

    return null;
  }

  //address validation
  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }

    if (value.length < 5) {
      return 'Address should be at least 5 characters';
    }

    return null;
  }

  //address validation (empty feilds acceptance, line 2 and line 3)
  String? validateOptionalAddressLine(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Allow null input for this field
    }
    return null;
  }

  //email validation with database
  List<String> registeredEmails = [
    'user1@example.com',
    'user2@example.com',
    'user3@example.com'
  ];

  String? validateEmail(String? value) {
    if (registeredEmails.contains(value)) {
      return 'This email is already in use';
    }

    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  //mobile number validation
  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }

    final RegExp numericRegex = RegExp(r'^[0-9]{8,15}$');

    if (!numericRegex.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }

    return null;
  }

  //password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    final RegExp upperCaseRegex = RegExp(r'[A-Z]');
    final RegExp numericOrSymbolRegex = RegExp(r'^(?=.*[0-9!@#\$&*])');

    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }

    if (!upperCaseRegex.hasMatch(value)) {
      return 'Password should contain at least 1 uppercase letter';
    }

    if (!numericOrSymbolRegex.hasMatch(value)) {
      return 'Password requires at least 1 number or a special character';
    }

    return null;
  }

  //confirm password validation
  String? validatePasswordConfirm(String? password, String? confirmPassword) {
    debugPrint('The value of myVariable is: $confirmPassword');

    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please enter your password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
