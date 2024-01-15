import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/components/custom_placeholder.dart';
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/views/components/other_heading.dart';
//import 'package:smart_fit_on/views/components/reg_headline.dart';
//import 'package:smart_fit_on/views/cus_screens/cus_home.dart';
import 'package:smart_fit_on/views/cus_screens/still_dev.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Product extends StatefulWidget {
  final String name;
  final String description;
  final int price;
  final String imageUrl;

  const Product({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

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
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //heading
                        OtherHeading(
                          headerText: widget.name,
                          icon: Icons.play_arrow_rounded,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),

                        //pricing circle
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

                    //product tile
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
                        child: CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          height: 200,
                          placeholder: (context, url) =>
                              const CustomPlaceholder(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // container (about product + 2 Grouped buttons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //about product
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

                        // Grouped buttons only
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              // Container with favourite button
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const StillDev()),
                                  );
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const StillDev()),
                                  );
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

                    //product description
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 15,
                                fontFamily: "secondary",
                              ),
                              overflow: TextOverflow
                                  .visible, // Set overflow to visible
                              softWrap:
                                  true, // Allow text to wrap onto the next line (shrink effect)
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    //try on button
                    GestureDetector(
                      child: LongBtn(
                        btnColor: Colors.black,
                        btnText: "TRY ON",
                        btnTextColor: Colors.white,
                        isBorderRequired: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StillDev()),
                          );
                        },
                        isIcon: true,
                        icon: Icons.camera_alt,
                      ),
                    ),
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
