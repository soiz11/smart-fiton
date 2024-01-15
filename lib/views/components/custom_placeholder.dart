import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class CustomPlaceholder extends StatelessWidget {
  const CustomPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.mainGreen,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 60,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.mainGreen,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
