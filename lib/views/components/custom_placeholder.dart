import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class CustomPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60, // Set the desired width
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.mainGreen,
            borderRadius:
                BorderRadius.circular(2), // Set the desired border radius
          ),
        ),
        SizedBox(
            height: 20), // Adjust the space between the two boxes as needed
        Container(
          width: 60, // Set the desired width
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.mainGreen,
            borderRadius:
                BorderRadius.circular(2), // Set the desired border radius
          ),
        ),
      ],
    );
  }
}
