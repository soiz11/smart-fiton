import 'package:flutter/material.dart';
//NEVER USE , SET FOR CHEKOUT AND CART

// ignore: must_be_immutable
class ShortBtn extends StatelessWidget {
  final Color btnColor;
  final Color btnTextColor;
  final String btnText;
  final bool isBorderBlack;
  final Function()? onTap;
  IconData? icon;
  bool? isIcon;

  ShortBtn({
    super.key,
    required this.btnColor,
    required this.btnText,
    required this.btnTextColor,
    required this.isBorderBlack,
    required this.onTap,
    this.icon,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: isBorderBlack
                ? Border.all(color: Colors.black, width: 2)
                : Border.all(color: Colors.white, width: 2),
          ),
          child: Center(
            child: Transform.translate(
              offset: const Offset(0, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    btnText,
                    style: TextStyle(
                        color: btnTextColor,
                        fontFamily: "main",
                        fontSize: 12,
                        letterSpacing: 1.0),
                  ),
                  isIcon == false
                      ? const SizedBox.shrink()
                      : Icon(
                          icon,
                          color: Colors.white,
                          size: 40,
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
