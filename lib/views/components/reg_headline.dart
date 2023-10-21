import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class RegHeading extends StatelessWidget {
  final String btnText;
  const RegHeading({super.key, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 70),

        Text(
          btnText,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "main",
            fontSize: 50,
          ),
        ),

        Container(
          height: 5,
          color: AppColors.mainGreen,
        )

        // Add your additional widget here
      ],
    );
  }
}
