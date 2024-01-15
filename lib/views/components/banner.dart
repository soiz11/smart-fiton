import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class CusBanner extends StatelessWidget {
  const CusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
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
          //left side of row
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                  //color: Colors.green,
                  ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 243, 114, 33), uses for margin identification
                          ),
                      padding: const EdgeInsets.only(top: 30.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'FASHION THURSDAY',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontFamily: "main",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          //color: Color.fromARGB(255, 33, 243, 89), uses for margin identification
                          ),
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Product 1 is simply dummy text  printing and typesetting ',
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
                ],
              ),
            ),
          ),

          //right side of row
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "lib/assets/images/poster_girl.png",
                fit: BoxFit.fitHeight,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
