import 'package:flutter/material.dart';
import 'package:test7/UI/component/order_card.dart';
import '../../model/order.dart';
import '../../point.dart';
import '../component/detail_order.dart';
import '../component/top_banner_order_list.dart';
import 'loading_screen.dart';

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
      backgroundColor: const Color(0xFFFBFBFB),
      body: Stack(
        children: [
          Column(
            children: [
              TopBannerOrderList(
                onTap: () {
                  debugPrint("ddsds");
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return OrderDetail(order: orders[index]);
                          },
                        );
                      },
                      child: OrderCard(
                        order: orders[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A550),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const LoadingScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          "Crea itinerario",
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image(
                            color: Colors.white,
                            image: AssetImage("assets/conversion_path.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
