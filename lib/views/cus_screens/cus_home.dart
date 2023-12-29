import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/components/custom_text_feild.dart';
import 'package:smart_fit_on/views/components/banner.dart';
import 'package:smart_fit_on/views/components/single_tile.dart';
import 'package:smart_fit_on/views/components/single_tile.dart';

class CusHome extends StatefulWidget {
  const CusHome({super.key});

  @override
  State<CusHome> createState() => _CusHomeState();
}

String search = '';

class _CusHomeState extends State<CusHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyGrey,
      appBar: AppBar(
        backgroundColor: AppColors.mainGreen,
        elevation: 0, // remove the shadow
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                // TextField(
                //   style: TextStyle(color: Colors.white),
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Color(0xffa8cf83),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //       borderSide: BorderSide.none,
                //     ),
                //     hintText: "Search",
                //     suffixIcon: Icon(Icons.search, color: AppColors.mainGreen),
                //   ),
                // ),
                const SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    // Handle click on the avatar
                    print('Avatar clicked');
                  },
                  child: ClipOval(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Image.asset(
                        'lib/assets/images/girl.png',
                        // Replace with the correct image asset path
                        width: 44, // Adjust the width as needed
                        height: 44, // Adjust the height as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CusBanner(),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true, // Add shrinkWrap: true to GridView
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                  children: const [
                    // Your GridView items go here
                    // For example, you can use SingleTile() widgets here
                    SingleTile(),
                    SingleTile(),
                    SingleTile(),
                    SingleTile(),
                    SingleTile(),

                    // Add more DualTile widgets as needed
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
