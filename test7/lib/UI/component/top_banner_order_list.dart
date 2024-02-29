import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopBannerOrderList extends StatelessWidget {
  final VoidCallback onTap;
  const TopBannerOrderList({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Color(0xFF00A550),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(120)),
        boxShadow: [
          BoxShadow(
              blurRadius: 0,
              color: Color.fromRGBO(163, 223, 192, 0.37),
              spreadRadius: 10,
              offset: Offset(-14, 8)),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => onTap(),
                  child: const Image(
                    width: 30,
                    height: 30,
                    color: Colors.white,
                    image: AssetImage("assets/menu.png"),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "I tuoi ordini",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text:
                            'La lista degli ordini previsti per la \nconsegna oggi: ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFE3E2E2),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: DateFormat.yMd().format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFE3E2E2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 11, right: 5),
                child: Image(
                  color: Color(0xFFA3DFC0),
                  image: AssetImage("assets/package.png"),
                ),
              ),
              Image(
                color: Color(0xFFA3DFC0),
                image: AssetImage("assets/local_shipping.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
