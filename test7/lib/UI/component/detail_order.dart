import 'package:flutter/material.dart';
import '../../model/order.dart';

class OrderDetail extends StatelessWidget {
  final Order order;
  const OrderDetail({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: 100,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(1400)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFE5E5E5)),
                child: const Image(
                  width: 20,
                  height: 20,
                  image: AssetImage("assets/close_1.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Text(
              "Dettagli ordine N. ${order.id}",
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A550),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Image(
                      width: 20,
                      height: 20,
                      color: Colors.white,
                      image: AssetImage("assets/navigation.png"),
                    ),
                    Text(
                      "  Avvia",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Color(0xFF00A550))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Indicazioni",
                  style: TextStyle(color: Color(0xFF00A550)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFF00A550), width: 0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Image(
                    color: Color(0xFF00A550),
                    image: AssetImage("assets/account.png"),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Cliente: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    order.recipient,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFF00A550), width: 0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Image(
                    color: Color(0xFF00A550),
                    image: AssetImage("assets/point.png"),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Luogo di consegna: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    order.address,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFF00A550), width: 0.5),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Image(
                    color: Color(0xFF00A550),
                    image: AssetImage("assets/acute.png"),
                  ),
                  SizedBox(width: 14),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Orario consegna: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "11:45",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Tempo stimato: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "20 min",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFF00A550), width: 0.5),
                bottom: BorderSide(color: Color(0xFF00A550), width: 0.5),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Image(
                    color: Color(0xFF00A550),
                    image: AssetImage("assets/add_road.png"),
                  ),
                  SizedBox(width: 14),
                  Text(
                    "Distanza: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "20 km",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Note ordine",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
