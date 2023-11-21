import 'package:flutter/material.dart';
import 'package:smart_fit_on/views/components/long_card.dart';
import 'package:smart_fit_on/views/components/short_btn.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class CusCart extends StatefulWidget {
  const CusCart({super.key});

  @override
  State<CusCart> createState() => _CusCartState();
}

class _CusCartState extends State<CusCart> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColors.bodyGrey,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    /* 
                    GestureDetector(
                      child: ShortBtn(
                        btnColor: AppColors.bodyGrey,
                        btnText: "REMOVE",
                        btnTextColor: Colors.black,
                        isBorderBlack: true,
                        onTap: () {},
                      ),
                    ),*/
                    const LongCard(),
                  ],
                ),
              ),
            ),
          )

          //Text(
          //   "Cart",
          //   style: TextStyle(
          //     fontFamily: "Main",
          //     fontSize: 66,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          ),
    );
  }
}
