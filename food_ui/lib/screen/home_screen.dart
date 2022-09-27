import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_ui/data/data.dart';
import 'package:food_ui/data/data.dart';
import 'package:food_ui/models/restaurant.dart';
import 'package:food_ui/screen/recent_order.dart';
import 'package:food_ui/screen/restaurant_screen.dart';

import '../data/data.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RestaurantScreen(
                    restaurant: restaurant,
                  )));
        },
        child: Container(
          height: 150,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(.2),
          ),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    image: AssetImage("${restaurant.imageUrl}")),
              ),
              SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: Column(
                    children: [
                      Text("${restaurant.name}"),
                      Text("${restaurant.address}"),
                      Text("0.2 miles"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });

    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Food Delivery App"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Cart:(${currentUser.cart?.length})',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  // color: Colors.grey,
                ),
                suffixIcon: Icon(Icons.close),
              ),
            ),
          ),
          RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Near Me Restaurants', style: TextStyle(fontSize: 25)),
              SizedBox(
                height: 8,
              ),
              buildRestaurant(),
            ],
          ),
        ],
      ),
    );
  }
}
