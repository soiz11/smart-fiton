import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';

import 'package:smart_fit_on/views/components/banner.dart';
import 'package:smart_fit_on/views/components/single_tile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_fit_on/views/cus_screens/profile.dart';
import 'package:smart_fit_on/controllers/firebase_services.dart';

class CusHome extends StatefulWidget {
  const CusHome({super.key});

  @override
  State<CusHome> createState() => _CusHomeState();
}

class _CusHomeState extends State<CusHome> {
  late Future<QuerySnapshot> _future;

  //firebase instance create for data fetch
  @override
  void initState() {
    super.initState();
    _future = FirebaseFirestore.instance.collection('productData').get();
  }

  final FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyGrey,
      appBar: AppBar(
        //upper bar
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await _firebaseServices.fetchBuyerData(context, "username");

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                addressLine1: "",
                                addressLine2: "",
                                addressLine3: "",
                                firstName: "",
                                lastName: '',
                              )),
                    );
                  },

                  //profile icon section
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/images/girl.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
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
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //top banner
                const CusBanner(),

                //firebase query for data fetch for grid view
                FutureBuilder<QuerySnapshot>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        margin: const EdgeInsets.only(top: 100.0),
                        child: const Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.mainGreen)),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      var products = snapshot.data!.docs;

                      return ProductGridView(products: products);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//gridview layout
class ProductGridView extends StatelessWidget {
  final List<QueryDocumentSnapshot> products;

  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        products.length,
        (index) => SingleTile(
          name: products[index]['name'] ?? '',
          description: products[index]['description'] ?? '',
          price: (products[index]['price'] as num?)?.toInt() ?? 0,
          imageUrl: products[index]['imageUrl'] ?? '',
        ),
      ),
    );
  }
}
