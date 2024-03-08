import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartNavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  const StartNavigationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00A550),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: [
            const Text(
              "Crea itinerario",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Kulim Park',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/svg/conversion_path.svg',
                width: 40,
                height: 40,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
