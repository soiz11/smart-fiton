import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.validator,
      required this.onChanged})
      : super(key: key);

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
        filled: true,
        fillColor: AppColors.fieldWhite,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
