import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/views/components/other_heading.dart';
import 'package:smart_fit_on/views/components/reg_headline.dart';
import 'package:smart_fit_on/views/cus_screens/cus_home.dart';

class Product extends StatefulWidget {
  final String name;
  final String description;
  final int price;
  final String imageUrl;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.bodyGrey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Add your header widget here

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment
                          .end, // Align elements with space between
                      children: [
                        OtherHeading(
                          headerText: '${widget.name}',
                          icon: Icons.play_arrow_rounded,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        // Add space between elements

                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: AppColors.bodyGrey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: AppColors.mainGreen,
                              width: 4.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '\$${widget.price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 31,
                                fontFamily: "main",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        color: AppColors.bodyGrey,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'lib/assets/images/shirt.png', // Replace with your actual image path
                          height:
                              200, // Adjust the height of the image as needed
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text widget
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Text(
                            "About Product",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: "secondary",
                            ),
                          ),
                        ),

                        // Grouped containers
                        Padding(
                          padding: const EdgeInsets.only(
                              right:
                                  10.0), // Adjust the right padding as needed
                          child: Row(
                            children: [
                              // Container with favourite button
                              GestureDetector(
                                onTap: () {
                                  // Handle the onTap event for the favourite button here
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainGreen,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'lib/assets/images/hearticon.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              // Container with cart button
                              GestureDetector(
                                onTap: () {
                                  // Handle the onTap event for the cart button here
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainGreen,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'lib/assets/images/checkouticon.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0), // Adjust the right padding as needed
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${widget.description}',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 15,
                                fontFamily: "secondary",
                              ),
                              overflow: TextOverflow
                                  .visible, // Set overflow to visible
                              softWrap:
                                  true, // Allow text to wrap onto the next line
                            ),
                          ),

                          // Add more widgets as needed
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    GestureDetector(
                      child: LongBtn(
                        btnColor: Colors.black,
                        btnText: "TRY ON",
                        btnTextColor: Colors.white,
                        isBorderRequired: false,
                        onTap: () {},
                        isIcon: true,
                        icon: Icons.camera_alt,
                      ),
                    ),

                    // Add other widgets or components here
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
