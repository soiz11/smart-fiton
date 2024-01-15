import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class RegHeading extends StatelessWidget {
  final String headerText;
  final IconData icon;
  final Function()? onTap;
  const RegHeading(
      {super.key,
      required this.headerText,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 20),

            //icon

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.141), // Rotate 180 degrees
                    child: Icon(
                      icon,
                      color: AppColors.mainGreen,
                      size: 60,
                    ),
                  ),
                ),
                Text(
                  headerText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "main",
                    fontSize: 50,
                  ),
                ),
              ],
            ),

            //line
            Container(
              height: 5,
              color: AppColors.mainGreen,
            )
          ],
        )
      ],
    );
  }
}
