import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  List<bool> test = [true,false,false,false,false];
  var count = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Esegui la funzione ogni 5 secondi
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Chiamata alla tua funzione
      animation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            test[0] ? RotatePackage() : NormalPackage(),
            SizedBox(width: 24),
            test[1] ? RotatePackage() : NormalPackage(),
            SizedBox(width: 24),
            test[2] ? RotatePackage() : NormalPackage(),
            SizedBox(width: 24),
            test[3] ? RotatePackage() : NormalPackage(),
            SizedBox(width: 24),
            test[4] ? RotatePackage() : NormalPackage(),
          ],
        ),
      ),
    );
  }
  void animation(){
    setState(() {
      test[count] = !test[count];
      if(count != 4){
        test[count + 1] = !test[count +1];
        count = count + 1;
      }else{
        test[0] = !test[0];
        count = 0;
      }
    });
  }
}

class NormalPackage extends StatelessWidget {
  const NormalPackage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Image(
      width: 38,
      height: 38,
      color: Color(0xFF00A550),
      image: AssetImage("assets/package_2.png"),
    );
  }
}

class RotatePackage extends StatelessWidget {
  const RotatePackage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Transform.rotate(
        angle: 45 * (3.141592653589793 / 180),
        child: const Image(
          color: Color(0xFF00A550),
          image: AssetImage("assets/package_2.png"),
        ),
      ),
    );
  }
}