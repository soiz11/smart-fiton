import 'package:flutter/material.dart';
import 'package:smart_fit_on/views/components/reg_headline.dart';
import 'package:smart_fit_on/views/components/custom_text_feild.dart';
import 'package:smart_fit_on/views/authentication/on_boarding.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'dart:developer' as dev;
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/controllers/form_validators.dart';

class AsBuyer extends StatefulWidget {
  const AsBuyer({super.key});

  @override
  State<AsBuyer> createState() => _AsBuyerState();
}

String firstNameValue = "";
String lastNameValue = "";
String nicNoValue = "";
String addressLine1Value = "";
String addressLine2Value = "";
String addressLine3Value = "";

final _formKey = GlobalKey<FormState>();
final _formValidators = FormValidators();

class _AsBuyerState extends State<AsBuyer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bodyGrey,
        image: DecorationImage(
          image: AssetImage("lib/assets/images/blackbg.png"),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              //header

                              const SizedBox(height: 30),
                              RegHeading(
                                headerText: "BUYER",
                                icon: Icons.play_arrow_rounded,
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          OnBoarding(
                                        isSeller: true,
                                        isBuyer: false,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 50),

                              CustomTextField(
                                hintText: 'First Name',
                                validator: (String? value) =>
                                    FormValidators.validateName(value, 'First'),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      firstNameValue = value;
                                      dev.log(
                                          'Password Field Value: $firstNameValue');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'Last Name',
                                validator: (String? value) =>
                                    FormValidators.validateName(value, 'Last'),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      lastNameValue = value;
                                      dev.log(
                                          'Password Field Value: $lastNameValue ');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'NIC No',
                                validator: _formValidators.validateNIC,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      nicNoValue = value;
                                      dev.log(
                                          'Password Field Value: $nicNoValue');
                                    },
                                  );
                                },
                              ),

                              // Add other CustomTextField widgets

                              const SizedBox(height: 30),

                              CustomTextField(
                                hintText: 'Address Line 1',
                                validator: _formValidators.validateAddress,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      addressLine1Value = value;
                                      dev.log(
                                          'Password Field Value: $addressLine1Value');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'Address Line 2',
                                validator:
                                    _formValidators.validateOptionalAddressLine,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      addressLine2Value = value;
                                      dev.log(
                                          'Password Field Value: $addressLine2Value');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 10),

                              CustomTextField(
                                hintText: 'Address Line 3',
                                validator:
                                    _formValidators.validateOptionalAddressLine,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      addressLine3Value = value;
                                      dev.log(
                                          'Password Field Value: $addressLine3Value');
                                    },
                                  );
                                },
                              ),

                              const SizedBox(height: 30),

                              GestureDetector(
                                child: LongBtn(
                                    btnColor: AppColors.mainGreen,
                                    btnText: "SUBMIT",
                                    btnTextColor: Colors.white,
                                    isBorderRequired: false,
                                    onTap: () {
                                      //
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        // Use the _firstName variable for further processing

                                        dev.log('fname: $firstNameValue');
                                      }
                                    }),
                              ),

                              // Add other widgets here
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
