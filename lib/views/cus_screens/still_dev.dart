import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class StillDev extends StatelessWidget {
  const StillDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            width: 450,
            child: const Text(
              "Still in Development",
              style: TextStyle(
                  fontFamily: "secondary",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
