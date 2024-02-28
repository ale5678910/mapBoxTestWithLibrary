import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test7/UI/component/order_card.dart';

import '../../model/order.dart';
import '../../point.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Order> orders = [];
  Points points = Points();

  @override
  void initState() {
    orders.add(Order(
        id: 3434,
        recipient: "Esselunga",
        addressPoint: points.point1,
        address: "Via del Signore 7"));
    orders.add(Order(
        id: 3434,
        recipient: "Esselunga",
        addressPoint: points.point2,
        address: "Via del Signore 7"));
    orders.add(Order(
        id: 3434,
        recipient: "Esselunga",
        addressPoint: points.point3,
        address: "Via del Signore 7"));
    orders.add(Order(
        id: 3434,
        recipient: "Esselunga",
        addressPoint: points.point4,
        address: "Via del Signore 7"));
    orders.add(Order(
        id: 3434,
        recipient: "Esselunga",
        addressPoint: points.point5,
        address: "Via del Signore 7"));
    orders.add(Order(
        id: 3434,
        recipient: "Esselunga",
        addressPoint: points.point6,
        address: "Via del Signore 7"));
    orders.add(Order(
        id: 3434,
        recipient: "Esselunga",
        addressPoint: points.point7,
        address: "Via del Signore 7"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe3e0de),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(140)),
            ),
            child: const Image(
              color: Colors.white,
              image: AssetImage("assets/furgoncino.png"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(order: orders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
