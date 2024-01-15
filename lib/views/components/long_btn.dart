import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

// ignore: must_be_immutable
class LongBtn extends StatelessWidget {
  final Color btnColor;
  final Color btnTextColor;
  final String btnText;
  final bool isBorderRequired;
  final Function()? onTap;
  IconData? icon;
  bool? isIcon;

  LongBtn({
    super.key,
    this.btnColor = AppColors.mainGreen,
    required this.btnText,
    this.btnTextColor = Colors.white,
    this.isBorderRequired = false,
    required this.onTap,
    this.icon,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          border: isBorderRequired
              ? Border.all(color: Colors.black, width: 3)
              : null,
        ),
        child: Center(
          child: Transform.translate(
            offset: const Offset(0, 2), //moved 2 units down vertically
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  btnText,
                  style: TextStyle(
                    color: btnTextColor,
                    fontFamily: "main",
                    fontSize: 32,
                    letterSpacing: 1.0,
                  ),
                ),
                isIcon == false
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
