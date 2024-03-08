import 'package:flutter/material.dart';
import 'package:test7/model/colors.dart';
import '../../model/order.dart';
import '../../point.dart';
import '../component/detail_order.dart';
import '../component/order_card.dart';
import '../component/start_navigation_button.dart';
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
  AppColors colors = AppColors();

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const TopBannerOrderList(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return OrderDetail(order: orders[index]);
                          },
                        );
                      },
                      child: (index != (orders.length - 1))
                          ? OrderCard(order: orders[index])
                          : Column(
                              children: [
                                OrderCard(order: orders[index]),
                                const SizedBox(height: 90),
                              ],
                            ),
                    );
                  },
                ),
              ),
              //SizedBox(height: 90,),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: StartNavigationButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoadingScreen(),
                        ),
                      );
                    },
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
