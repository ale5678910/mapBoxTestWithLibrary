import 'package:flutter/material.dart';
import 'package:test7/model/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.11),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F9F6),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: const Center(
                  child: Text(
                    "11:25",
                    style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFF00A550),
                      fontWeight: FontWeight.w700,
                    ),
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
                            bottom:
                                BorderSide(color: Color(0xFF00A550), width: 1),
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
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Kulim Park',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF251F21),
                                ),
                              ),
                              Text(
                                order.id.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF251F21),
                                ),
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
                              color: Color(0xFF00A550),
                              image: AssetImage("assets/account.png"),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              order.recipient,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF585858),
                                fontFamily: 'Kulim Park',
                              ),
                            ),
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
                              color: Color(0xFF00A550),
                              image: AssetImage("assets/point.png"),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              order.address,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF585858),
                                fontFamily: 'Kulim Park',
                              ),
                            ),
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
