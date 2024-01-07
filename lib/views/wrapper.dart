import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_fit_on/models/UserModel.dart';
import 'package:smart_fit_on/views/authentication/authenticate.dart';
import 'package:smart_fit_on/views/cus_screens/cus_home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return CusHome();
    }
  }
}
