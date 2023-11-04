import 'package:smart_fit_on/views/cus_screens/cus_cart/cus_price.dart';
import 'package:smart_fit_on/views/cus_screens/cus_cart/cus_remove.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    //  int _currValue = 1;
    
    
    return Column(
      children: [Padding(
        padding: const EdgeInsets.all(0.25),
        child: Container(
          // color: Color.fromARGB(255, 242,242,242),
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          padding: EdgeInsets.all(10),
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
                      
                    ),],  ), 
      
         child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all (5),
                child:  Image.asset("lib/assets/images/shirt.png"),
                alignment: Alignment.centerLeft,
              ),
              
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              
               children: [
                Container (
                 margin: const EdgeInsets.only(right: 40),
                 child: const Text("PRODUCT ONE",
                 style: TextStyle(
                  fontSize: 35,  
                  fontFamily: 'Main',                
                 ),),
               ),

              
               Container(
                height: 50,
                width: 120,
                padding: EdgeInsets.all(2),
                // alignment: Alignment.center,
                child: const Text("product 1. this is the testing text to description  ",
                style: TextStyle(
                  fontSize: 10,
                  height: 1.5,
                  fontFamily: 'Secondary',
                ),),
               ),
                const CartItem3(),
               ],                       
             ),

            Row(
            
            children: [
            Radio(
              value: "", groupValue: "groupValue", onChanged:(index) {}, activeColor: Color.fromARGB(255, 58, 204, 94),
              
        
            ),
            ],),
      
           
            ],
           ),        
         ),     
    ),],
    );    
  }
}
 class CartItem2 extends StatelessWidget {
                    const CartItem2({super.key});

  @override
  Widget build(BuildContext context) {
    //  int _currValue = 1;
    return const Remove( );
  }
 }

 class CartItem3 extends StatelessWidget {
        const CartItem3 ({super.key});

  @override
  Widget build(BuildContext context) {
    //  int _currValue = 1;
    return const Price();
  }
 }

