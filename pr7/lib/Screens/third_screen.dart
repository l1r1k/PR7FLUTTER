import 'package:flutter/material.dart';

class third_page extends StatelessWidget{
  const third_page({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        child: Text("Map"),
        decoration: BoxDecoration(
          color: Colors.limeAccent
        ),
      ),
    );
  }
}