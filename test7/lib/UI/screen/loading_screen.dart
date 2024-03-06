import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animation_loading_2.json'),
          const SizedBox(
            height: 20,
          ),
          Lottie.asset(
            'assets/loader_bar.json',
            width: 200,
            height: 20,
            fit: BoxFit.fill,
          ),
          const Text(
            "Caricamento percorso",
          ),
        ],
      ),
    );
  }
}
