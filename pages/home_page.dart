import 'package:flutter/material.dart';
import 'package:project1/pages/util/coffee_tile.dart';
import 'package:project1/pages/util/coffee_type.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final List coffeeType = [
    ["Ice Coffee", true],
    ["Latte", false],
    ["Turkish Coffee", false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            size: 30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.person,
                size: 30,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ]),
        // find the best coffee for you
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Find the best coffee for you",
              style: TextStyle(fontFamily: "BebasNeue", fontSize: 45),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                ),
                hintText: "Find your coffee..",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange.shade400)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: ((context, index) {
                  return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: (() {
                        coffeeTypeSelected(index);
                      }));
                })),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: "lib/images/icecoffee.jpg",
                  coffeeName: "Ice Coffee",
                  coffeePrice: "4.20",
                ),
                CoffeeTile(
                  coffeeImagePath: "lib/images/lattee.jpg",
                  coffeeName: "Latte",
                  coffeePrice: "5.50",
                ),
                CoffeeTile(
                  coffeeImagePath: "lib/images/turkishcoffee.jpg",
                  coffeeName: "Turkish Coffee",
                  coffeePrice: "6.00",
                ),
              ],
            ),
          ),
        ]));
  }
}
