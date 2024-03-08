import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        mainAxisSize: MainAxisSize.min,
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
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset(
                  'assets/svg/close_small.svg',
                  width: 10,
                  height: 10,
                  fit: BoxFit.scaleDown,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Text(
              "Dettagli ordine N. ${order.id}",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                fontFamily: 'Kulim Park',
                color: Color(0XFF404040),
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
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/navigation.svg',
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const Text(
                      "  Avvia",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFF00A550),
                  ),
                ),
                onPressed: () {},
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
                top: BorderSide(
                  color: Color(0xFF00A550),
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/account.svg',
                    width: 22,
                    height: 22,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF00A550),
                      BlendMode.srcIn,
                    ),
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
                top: BorderSide(
                  color: Color(0xFF00A550),
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/location.svg',
                    width: 22,
                    height: 22,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF00A550),
                      BlendMode.srcIn,
                    ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/acute.svg',
                    width: 22,
                    height: 22,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF00A550),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Column(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/add_road.svg',
                    width: 22,
                    height: 22,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF00A550),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Distanza: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
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
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color(0XFF404040),
                fontFamily: 'Kulim Park',
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
