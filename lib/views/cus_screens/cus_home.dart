import 'package:flutter/material.dart';
import 'package:smart_fit_on/assets/colors/colors.dart';
import 'package:smart_fit_on/views/components/custom_text_feild.dart';
import 'package:smart_fit_on/views/components/banner.dart';
import 'package:smart_fit_on/views/components/single_tile.dart';
import 'package:smart_fit_on/views/components/single_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CusHome extends StatefulWidget {
  const CusHome({Key? key}) : super(key: key);

  @override
  State<CusHome> createState() => _CusHomeState();
}

class _CusHomeState extends State<CusHome> {
  late Future<QuerySnapshot> _future;

  @override
  void initState() {
    super.initState();
    _future = FirebaseFirestore.instance.collection('productData').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyGrey,
      appBar: AppBar(
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                // ... existing code
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

class ProductGridView extends StatelessWidget {
  final List<QueryDocumentSnapshot> products;

  const ProductGridView({Key? key, required this.products}) : super(key: key);

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
