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
}
