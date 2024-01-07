import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/components/long_btn.dart';
import 'package:smart_fit_on/views/components/other_heading.dart';
import 'package:smart_fit_on/views/cus_screens/still_dev.dart';
import 'package:smart_fit_on/controllers/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String addressLine1;
  final String addressLine2;
  final String addressLine3;
  final String firstName;
  final String lastName;

  Profile({
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
            children: <Widget>[
              const SizedBox(height: 10),
              OtherHeading(
                headerText: 'MY PROFILE',
                icon: Icons.play_arrow_rounded,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 163, 163, 163),
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
              const SizedBox(height: 10),
              Container(
                height: 250,
                width: 260,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0.0),
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
                      //name
                      Container(
                        width: 180,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          // Customize the color as needed
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
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
                            SizedBox(
                                height:
                                    0), // Adjust the spacing between Text widgets
                            Text(
                              widget.firstName,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0),
                      // Adjust the spacing between Text widgets

                      //username
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          // Customize the color as needed
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontFamily: "secondary",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0),
                            FutureBuilder(
                              future: _userEmailFuture,
                              builder:
                                  (context, AsyncSnapshot<String?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  String? userEmail = snapshot.data;
                                  return Text(
                                    '${userEmail}',
                                    style: TextStyle(
                                        fontFamily: "terinary",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textGrey),
                                  );
                                }
                              },
                            ), // Adjust the spacing between Text widgets
                          ],
                        ),
                      ),

                      SizedBox(height: 0),

                      //address
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          // Customize the color as needed
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
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
                            //hhhhhh
                            Text(
                              widget.addressLine1,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                            Text(
                              widget.addressLine2,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                            Text(
                              widget.addressLine3,
                              style: TextStyle(
                                  fontFamily: "terinary",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGrey),
                            ),
                            // Adjust the spacing between Text widgets
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
