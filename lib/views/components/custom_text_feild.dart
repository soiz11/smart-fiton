import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#8bd840"))),
        hintText: widget.hintText,
        filled: true,
        fillColor: HexColor("#ededed"),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
