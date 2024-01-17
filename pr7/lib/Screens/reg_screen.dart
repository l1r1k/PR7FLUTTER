import 'package:flutter/material.dart';

class reg_screen extends StatelessWidget{
  const reg_screen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("home");
        },
        child: Icon(Icons.home),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Login"),
            ),
            TextField(

            ),
            Text("Password"),
            TextField(

            ),
            TextButton(onPressed: (){}, child: Text("Reg!"))
          ],
        ),
      ),
    );
  }
}