import 'package:flutter/material.dart';

import '../main.dart';

class first_page extends StatefulWidget{
  String? text;
  first_page({super.key, @required this.text});

  @override
  State<first_page> createState() => first_page_state(this.text);
}

enum furniture_filter {Chair, Table, Bed}

class first_page_state extends State<first_page>{

  List<furniture_filter> categoryes = [];
  List<Furniture> filterFurnitures = [];

  late Furniture firstChair;
  late Furniture secondChair;
  late Furniture thirdChair;
  late Furniture fourthChair;
  late List<Furniture> furnitures;
  late String text;

  first_page_state(String? text){
    this.text = text ?? "";
    firstChair = Furniture('FirstChair', 'Chair', 2999.00, 'A piece of furniture for the seating of one person, with back support (as opposed to a stool), with or without armrests.');
    secondChair = Furniture('SecondTable', 'Table', 4699.99, 'A piece of furniture that has a raised horizontal or inclined surface and is intended for placing objects, performing work, eating, playing, drawing, learning and other activities.');
    thirdChair = Furniture('ThirdBed', 'Bed', 9999.99, 'A piece of furniture, usually made of wood or metal and shaped like a rectangle or square.');
    fourthChair = Furniture('FourthChair', 'Chair', 4999.99, 'A piece of furniture for the seating of one person, with back support (as opposed to a stool), with or without armrests.');
    furnitures = [
      firstChair,
      secondChair,
      thirdChair,
      fourthChair
    ];
    if(text == ""){
      for(int i = 0; i < furnitures.length; i++){
        filterFurnitures.add(furnitures[i]);
      }
    }else{
      for(int i = 0; i < furnitures.length; i++){
        if(furnitures[i].name == text){
          filterFurnitures.add(furnitures[i]);
        }
      }
    }
    print('first ${this.text}');
  }
  bool isCheck = true;
  void onChange(){
    setState(() {
      if(isCheck){
        isCheck = false;
      }else{
        isCheck = true;
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Wrap(
              spacing: 5.0,
              children: furniture_filter.values.map((furniture_filter filter) {
                return FilterChip(
                  label: Text(filter.name),
                  selected: categoryes.contains(filter),
                  onSelected: (bool selected){
                    setState(() {
                      if(text != ""){
                        filterFurnitures = [];
                        for(int i = 0; i < furnitures.length; i++){
                          filterFurnitures.add(furnitures[i]);
                        }
                      }
                      if(selected){
                        categoryes.add(filter);
                      }else{
                        categoryes.remove(filter);
                      }
                      if(categoryes.length > 0){
                        filterFurnitures = [];
                        for(int i = 0; i < categoryes.length; i++){
                          for(int j = 0; j < furnitures.length; j++){
                            if (furnitures[j].category == categoryes[i].name){
                              filterFurnitures.add(furnitures[j]);
                            }
                          }
                        }
                      }else{
                        filterFurnitures = [];
                        for(int j = 0; j < furnitures.length; j++){
                            filterFurnitures.add(furnitures[j]);
                        }
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              'Looking furnitures with these categories: ${categoryes.map((furniture_filter e) => e.name).join(', ')}',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: double.infinity,
            height: 500,
            child: ListView.builder(
              itemCount: filterFurnitures.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.center,
                  child: AnimatedCrossFade(
                    firstChild: InkWell(
                      onTap: onChange,
                      child: Container(
                        height: 100,
                        width: 300,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text('Name: ${filterFurnitures[index].name ?? ""}'),
                                ),
                                Container(
                                  child: Text('Category: ${filterFurnitures[index].category ?? ""}'),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              alignment: Alignment.centerRight,
                              child: Text('Cost: ${filterFurnitures[index].cost} rub.'),
                            )
                          ],
                        ),
                      ),
                    ),
                    secondChild: InkWell(
                      onTap: onChange,
                      child: Container(
                          height: 150,
                          width: 300,
                          color: Colors.black26,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text('Name: ${filterFurnitures[index].name ?? ""}'),
                                ),
                                Container(
                                  child: Text('Category: ${filterFurnitures[index].category ?? ""}'),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              alignment: Alignment.centerRight,
                              child: Text('Cost: ${filterFurnitures[index].cost} rub.'),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: Text('Info: ${filterFurnitures[index].information}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    crossFadeState: isCheck ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 400),
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}