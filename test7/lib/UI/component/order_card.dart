import 'package:flutter/material.dart';
import 'package:test7/model/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFe3e0de),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: const Center(
                  child: Text(
                    "11:25",
                    style: TextStyle(fontSize: 24,color: Colors.green),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.green, width: 1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              const Image(
                                color: Colors.green,
                                image: AssetImage("assets/package.png"),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "N. ordine - ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                order.id.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            const Image(
                              width: 20,
                              height: 20,
                              color: Colors.green,
                              image: AssetImage("assets/account.png"),
                            ),
                            const SizedBox(width: 10),
                            Text(order.recipient),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            const Image(
                              width: 20,
                              height: 20,
                              color: Colors.green,
                              image: AssetImage("assets/point.png"),
                            ),
                            const SizedBox(width: 10),
                            Text(order.address),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
