import 'package:smart_fit_on/views/cus_screens/cus_cart/cus_cart_Item.dart';
import 'package:flutter/material.dart';
// import 'package:smart_fit_on/views/cus_screens/cus_cart/cus_cart_Item.dart';


class Price extends StatelessWidget {
  const Price ({super.key});
  @override
  Widget build(BuildContext context) {
    //  int _currValue = 1;    
    return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width:30,
                    child: const Text("PRICE - ",                   
                    ),                    
                  ),
               Container(
                alignment: Alignment.centerLeft,
                
                  width: 10,
                  child: const Text("7\$ ", 
                 style: TextStyle(
                  color: Color.fromARGB(255, 66, 201, 136),
                 ),
                  ), 
               ), 
                 Container(
                alignment: Alignment.center,
                  // width: 20,
                  // height: 10,
                  child: const Icon(Icons.indeterminate_check_box,
) 
               ),
               Container(               
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.5),
                  color: Colors.grey[350],
                                   
                  ),   
                  width: 30,
                  height: 20,              
                  child: const Text("1",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,                     
                  ))
               ),
                Container(
                alignment: Alignment.centerLeft,                  
                  child: const Icon(Icons.add_box,
) 
               ),
               Container(
               child: const CartItem2(),

               ),                
                 ],
                
                );}} 
                