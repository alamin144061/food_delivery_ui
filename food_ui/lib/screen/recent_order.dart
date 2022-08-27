import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_ui/data/data.dart';

import '../models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);
  buildOrder(BuildContext context, order) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.orange,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image(
                height: double.infinity,
                width: 150,
                fit: BoxFit.cover,
                image: AssetImage('${order.food.imageUrl}')),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Text("${order.food!.name}"),
                Text("${order.restaurant.name}"),
                Text("${order.food.price}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Recent Order",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.orders![index];
                return buildOrder(context, order);
              }),
        ),
      ],
    );
  }
}
