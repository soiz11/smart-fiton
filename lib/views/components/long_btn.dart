import 'package:flutter/material.dart';

class LongBtn extends StatelessWidget {
  final Color btnColor;
  final Color btnTextColor;
  final String btnText;
  final bool isBorderRequired;
  final Function()? onTap;

  const LongBtn(
      {super.key,
      required this.btnColor,
      required this.btnText,
      required this.btnTextColor,
      required this.isBorderRequired,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(8),
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
            offset: const Offset(0, 2),
            child: Text(
              btnText,
              style: TextStyle(
                  color: btnTextColor,
                  fontFamily: "main",
                  fontSize: 32,
                  letterSpacing: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
