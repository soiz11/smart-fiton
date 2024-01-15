import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/views/components/other_heading.dart';
import 'package:smart_fit_on/views/cus_screens/still_dev.dart';
import 'package:smart_fit_on/controllers/firebase_services.dart';

class Profile extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String addressLine1;
  final String addressLine2;
  final String addressLine3;
  final String firstName;
  final String lastName;

  Profile({
    super.key,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.firstName,
    required this.lastName,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

final FirebaseServices _firebaseServices = FirebaseServices();

class _ProfileState extends State<Profile> {
  late Future<String?> _userEmailFuture;

  @override
  void initState() {
    super.initState();
    _userEmailFuture = _getCurrentUserEmail();
  }

  Future<String?> _getCurrentUserEmail() async {
    User? user = widget._auth.currentUser;
    return user?.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              //heading
              OtherHeading(
                headerText: 'MY PROFILE',
                icon: Icons.play_arrow_rounded,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //image container
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.darkGrey,
                    width: 6.0,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'lib/assets/images/girl.png', // replace with your image path
                    width: 170.0,
                    height: 170.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              //details container
              Container(
                height: 260,
                width: 260,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 0.0),
                decoration: BoxDecoration(
                  color: AppColors.bodyGrey,
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name container
                      Container(
                        width: 180,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontFamily: "secondary",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Pikdy Harloos",
                              //widget.firstName,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                          ],
                        ),
                      ),

                      //username conatainer
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Username',
                              style: TextStyle(
                                fontFamily: "secondary",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            //username fetch from firebase
                            FutureBuilder(
                              future: _userEmailFuture,
                              builder:
                                  (context, AsyncSnapshot<String?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  String? userEmail = snapshot.data;

                                  //dispalay username from database
                                  return Text(
                                    userEmail ?? "No email available",
                                    style: const TextStyle(
                                        fontFamily: "terinary",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textGrey),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),

                      //address container
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          // Customize the color as needed
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                fontFamily: "secondary",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            //3 address lines from database
                            Text(
                              '125/3 Pikdy road',
                              //widget.addressLine1,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                            Text(
                              'cross junction',
                              //widget.addressLine2,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                            Text(
                              "Colombo 3",
                              // widget.addressLine3,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //edit button
              GestureDetector(
                child: LongBtn(
                  btnColor: Colors.black,
                  btnText: "EDIT PROFILE",
                  btnTextColor: Colors.white,
                  isBorderRequired: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StillDev()),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              //signout button
              GestureDetector(
                child: LongBtn(
                  btnColor: AppColors.mainGreen,
                  btnText: "SIGN OUT",
                  btnTextColor: Colors.white,
                  isBorderRequired: false,
                  onTap: () {
                    _firebaseServices.signOut(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
