import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'order_list_screen.dart';

class PositionAut extends StatefulWidget {
  const PositionAut({super.key});

  @override
  State<PositionAut> createState() => _PositionAutState();
}

class _PositionAutState extends State<PositionAut> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_localization_aut.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              init();
            },
            child: Text("bhbn"),
          ),
        ),
      ),
    );
  }

  void init() async {
    var check = await _handleLocationPermission();
    if (check) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderListScreen(),
        ),
      );
    }
  }

  Future<bool> checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled;
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
