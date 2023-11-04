import 'package:flutter/material.dart';


class Remove extends StatelessWidget {
  const Remove ({super.key});

  @override
  Widget build(BuildContext context) {
    //  int _currValue = 1;
    
    
    return Container(
          // color: Color.fromARGB(255, 242,242,242),
          height: 10,
          width: 20,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: EdgeInsets.all(5),
              //borderRadius: BorderRadius.circular(10),
              // child: const FloatingActionButton(onPressed: ""),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 5.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
             color: const Color.fromARGB(255, 242,242,242),
           
           boxShadow: [
             BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                      
                    ),], 
                   ),
    
    );
  }
}
