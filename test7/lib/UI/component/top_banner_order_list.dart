import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TopBannerOrderList extends StatelessWidget {
  const TopBannerOrderList({super.key});

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
            offset: Offset(-14, 8),
          ),
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
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset(
                    'assets/svg/menu.svg',
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 11, right: 5),
                child: SvgPicture.asset(
                  'assets/svg/package_2_fill.svg',
                  width: 23,
                  height: 23,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFA3DFC0),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/svg/local_shipping.svg',
                width: 72,
                height: 72,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFA3DFC0),
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
