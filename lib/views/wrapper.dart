import 'package:flutter/material.dart';
import 'package:smart_fit_on/views/authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Authenticate(),
    );
  }
}
