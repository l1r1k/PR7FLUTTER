import 'package:flutter/material.dart';

class settings_screen extends StatefulWidget{
  const settings_screen({super.key});

  @override
  State<settings_screen> createState() => settings_screen_state();
}

class settings_screen_state extends State<settings_screen>{
  List<String> settingsButtonsList = [
    "On White Theme",
    "On Dark Theme",
    "Change Delivery Address",
    "Change Font Size",
    "On images",
    "Off images",
    "Change privacy",
    "Change language",
    "Change Account",
    "Change card",
    "Change payment method",
    "Change alert privacy",
    "Close active sessions",
    "Change login",
    "Change password",
    "Add Log In with QR-code",
    "Add Log In with Email",
    "Logout"
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("home");
        },
        child: Icon(Icons.home),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 50.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Settings'),
              background: Icon(Icons.settings),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see all settings buttons'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    color: index == settingsButtonsList.length - 1 ? Colors.redAccent : Colors.orangeAccent,
                    border: Border(
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                  ),
                  height: 100.0,
                  child: Center(
                    child: MaterialButton(
                      child: Text('${settingsButtonsList[index]}'),
                      onPressed: (){},
                    )
                  ),
                );
              },
              childCount: settingsButtonsList.length,
            ),
          ),
        ],
      ),
    );
  }
}