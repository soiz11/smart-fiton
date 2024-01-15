import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/components/short_btn.dart';

// FAVOUTITE AND CHECKOUT TEPLATE , BUT NEVER USED

class LongCard extends StatefulWidget {
  const LongCard({super.key});

  @override
  State<LongCard> createState() => _LongCardState();
}

const bool isFavourites = true;

class _LongCardState extends State<LongCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.bodyGrey,
        border: Border.all(color: Colors.white, width: 3),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "lib/assets/images/shirt.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  //color: Colors.green,
                  ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 243, 114, 33),
                          ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: // Adjust padding as needed
                            Text(
                          'PRODUCT ONE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: "main",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 33, 243, 89),
                          ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Phhdjdjcdsijdsocjjsijsiojs shfusdfhdsai hdushdsdh djhdhd sdsjhsadhisad  dhjsidjsada djsdia uhfiudsfn jdsipdfjsifdj',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 10,
                            fontFamily: "secondary",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 173, 33, 243),
                          ),
                      child: Row(
                        children: [
                          isFavourites
                              // ignore: avoid_unnecessary_containers
                              ? Container(
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Price - ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "main",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "7\$",
                                        style: TextStyle(
                                          color: AppColors.mainGreen,
                                          fontSize: 14,
                                          fontFamily: "main",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      ShortBtn(
                                          btnColor: AppColors.bodyGrey,
                                          btnText: "REMOVE",
                                          btnTextColor: Colors.black,
                                          isBorderBlack: true,
                                          onTap: () {}),
                                      ShortBtn(
                                          btnColor: AppColors.mainGreen,
                                          btnText: "CART",
                                          btnTextColor: Colors.white,
                                          isBorderBlack: false,
                                          onTap: () {}),
                                    ],
                                  ),
                                ) // Widget to render when isFav is true
                              : const Text(
                                  "CART"), // Widget to render when isFav is false
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
