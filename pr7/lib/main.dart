import 'package:flutter/material.dart';
import 'package:pr7/Screens/auth_screen.dart';
import 'package:pr7/Screens/first_screen.dart';
import 'package:pr7/Screens/second_screen.dart';
import 'package:pr7/Screens/third_screen.dart';
import 'package:pr7/custom_search_delegate.dart';
import 'package:url_launcher/url_launcher.dart';

import 'RouteGenerator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pr7',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: 'home',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Furniture{
  String? name;
  String? category;
  double? cost;
  String? information;

  Furniture(String name, String category, double cost, String information)
  {
    this.name = name;
    this.category = category;
    this.cost = cost;
    this.information = information;
  }
}

class _MyHomePageState extends State<MyHomePage> {

  _launchURL() async {
    final Uri url = Uri.parse('https://pm.ru/dostavka/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  String result = '';

  List<Widget> pages = [first_page(text: '',), second_page(), third_page()];
  int indexPage = 0;
  String title = "Furnitures";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          Padding(
              padding: EdgeInsets.all(0.0),
              child: MaterialButton(
                  child: Icon(Icons.search),
                  onPressed: () async{
                    result = await showSearch(context: context, delegate: custom_search_delegate()) ?? "";
                    Future.microtask(() async {
                      if(result != ""){
                        setState(() {
                          print(result);
                          pages[0] = first_page(text: result);
                        });
                      }
                    });
                  }
              )
          ),
          PopupMenuButton(
              icon: Icon(Icons.contact_page),
              itemBuilder: (context) => [
              PopupMenuItem(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Our phone number: +7(999)999-99-99")));
                },
                value: 1,
                child: const Text("Phone number"),
              ),
                PopupMenuItem(
                  onTap: () async{
                    final bool? result = await showDialog(context: context, builder: (context){
                      return AlertDialog(
                        actions: [
                          TextButton(onPressed: () async{
                            await _launchURL();
                            Navigator.of(context, rootNavigator: true).pop(true);
                          },
                              child: Text('Yes')),
                          TextButton(onPressed: (){
                            Navigator.of(context, rootNavigator: true).pop(false);
                          },
                              child: Text('No')),
                        ],
                        content: Text('Do you want open Delivery-Information in browser?'),
                        title: Text('Information'),
                      );
                    });
                  },
                  value: 1,
                  child: const Text("Information"),
                ),
          ]),
        ],
      ),
      body: pages[indexPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (value){
          setState(() {
            indexPage = value;
            switch(value){
              case 0:
                title = "Furnitures";
              case 1:
                title = "Cart";
              case 2:
                title = "Shops";
              case _:
                title = "Not found";
            }
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Furnitures"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Shops"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(decoration: BoxDecoration(color: Colors.orangeAccent), child: Center(
              child: Text("FurnitureShop",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 24.00,
                fontWeight: FontWeight.w400
              ),),
            ),),
            ListTile(
              title: Text("Authorization"),
              leading: Icon(Icons.login),
              onTap:(){
                Navigator.of(context).pushNamed('auth');
              }
            ),
            ListTile(
              title: Text("Registration"),
              leading: Icon(Icons.add),
              onTap: (){
                Navigator.of(context).pushNamed('reg');
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: (){
                Navigator.of(context).pushNamed('settings');
              },
            )
          ],
        )
      ),
    );
  }
}
