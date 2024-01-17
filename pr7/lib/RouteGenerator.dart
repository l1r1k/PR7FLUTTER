import 'package:flutter/material.dart';
import 'package:pr7/Screens/auth_screen.dart';
import 'package:pr7/Screens/first_screen.dart';
import 'package:pr7/Screens/reg_screen.dart';
import 'package:pr7/Screens/second_screen.dart';
import 'package:pr7/Screens/settings.dart';

import 'main.dart';

class RouteGenerator{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case 'home':
        return MaterialPageRoute(builder: (ctx)=>MyHomePage());
      case 'auth':
        return MaterialPageRoute(builder: (context)=> auth_screen());
      case 'reg':
        return MaterialPageRoute(builder: (context)=> reg_screen());
      case 'settings':
        return MaterialPageRoute(builder: (context)=> settings_screen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic>? _errorRoute(){
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        body:Center(
          child: Text("Page not found!"),
        ),
      );
    });
  }
}