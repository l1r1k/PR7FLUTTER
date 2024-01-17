import 'package:flutter/material.dart';

class second_page extends StatelessWidget{
  const second_page({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      widthFactor: double.infinity,
      heightFactor: double.infinity,
      child: Container(
        child: Text("Cart"),
        decoration: BoxDecoration(
          color: Colors.pinkAccent
        ),
      ),
    );
  }
}