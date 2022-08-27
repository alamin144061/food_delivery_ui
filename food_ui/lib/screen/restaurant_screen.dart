import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/food.dart';
import '../models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  Restaurant? restaurant;
  RestaurantScreen({this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage("${widget.restaurant!.imageUrl}")),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.restaurant!.name}"),
                  Text("${widget.restaurant!.address}"),
                ],
              ),
              Text('0.5 miles'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Review")),
              ElevatedButton(onPressed: () {}, child: Text("Contact")),
            ],
          ),
          Text(
            'Menu',
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
              child: GridView.count(
                  children:
                      List.generate(widget.restaurant!.menu!.length, (index) {
                    Food food = widget.restaurant!.menu![index];

                    return Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 175,
                            width: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("${food.imageUrl}")),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  crossAxisCount: 2))
        ],
      ),
    );
  }
}
