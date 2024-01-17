import 'package:flutter/material.dart';

class auth_screen extends StatelessWidget{
  const auth_screen({super.key});

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
        color: Colors.lightBlueAccent,
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
            TextButton(onPressed: (){}, child: Text("Auth!"))
          ],
        ),
      ),
    );
  }
}