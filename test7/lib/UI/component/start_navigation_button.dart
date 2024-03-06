import 'package:flutter/material.dart';

class StartNavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  const StartNavigationButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00A550),
      ),
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.only(left: 24),
        child: Row(
          children: [
            Text(
              "Crea itinerario",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Kulim Park',
              ),
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
    );
  }
}
