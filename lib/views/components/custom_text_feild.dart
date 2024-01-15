import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextStyle? errorTextStyle;
  final ValueChanged<String> onChanged;

  const CustomTextField(
      {super.key,
      this.errorTextStyle = const TextStyle(color: AppColors.errorRed),
      required this.hintText,
      required this.validator,
      required this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

String fieldValue = "";

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderGreen, width: 1.5)),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 18),
        filled: true,
        fillColor: AppColors.fieldWhite,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorStyle: widget.errorTextStyle,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
