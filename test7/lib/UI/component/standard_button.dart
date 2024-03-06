import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final String nameButton;
  const StandardButton({super.key, required this.nameButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF00A550),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Text(
            nameButton,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: "Kulim Park",
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
