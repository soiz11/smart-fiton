import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

class CusBanner extends StatelessWidget {
  const CusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
              decoration: const BoxDecoration(
                  //color: Colors.green,
                  ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 243, 114, 33),
                          ),
                      padding: EdgeInsets.only(top: 30.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: // Adjust padding as needed
                            Text(
                          'FASHION THURSDAY',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
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
                          // color: Color.fromARGB(255, 33, 243, 89),
                          ),
                      padding: EdgeInsets.only(bottom: 50.0),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: // Adjust padding as needed
                            Text(
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
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "lib/assets/images/poster_girl.png", // Replace with the actual asset path of your image
                fit: BoxFit.fitHeight,
                height: 140,
                alignment: Alignment.bottomRight,

                // Adjust the fit as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
