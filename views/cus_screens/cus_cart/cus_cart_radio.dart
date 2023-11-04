// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   int _currValue = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text("Default Radio Button"),
//       ),
//       body: Center(
//         child: Radio(
//           activeColor: Colors.green,
//           groupValue: _currValue,
//           onChanged: (int i) => setState(() => _currValue = i),
//           value: _currValue,
//         ),
//       ),
//     );
//   }
// }