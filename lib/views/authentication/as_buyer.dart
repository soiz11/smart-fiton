import 'package:flutter/material.dart';

class AsBuyer extends StatefulWidget {
  const AsBuyer({super.key});

  @override
  State<AsBuyer> createState() => _AsBuyerState();
}

class _AsBuyerState extends State<AsBuyer> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text("As Buyer"),
    );
  }
}
