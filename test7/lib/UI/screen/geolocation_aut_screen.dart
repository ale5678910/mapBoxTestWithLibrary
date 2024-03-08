import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import '../component/standard_button.dart';
import 'order_list_screen.dart';

class GeolocationAut extends StatefulWidget {
  const GeolocationAut({super.key});

  @override
  State<GeolocationAut> createState() => _GeolocationAutState();
}

class _GeolocationAutState extends State<GeolocationAut> {
  bool layoutVisibility = true;

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
        child: Visibility(
          visible: layoutVisibility,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Column(
                      children: [
                        const Text(
                          "La tua posizione",
                          style: TextStyle(
                              fontFamily: 'Kulim Park',
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              color: Color(0XFF1E1E1E)),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Consenti a LMM Logistics di accedere alla tua posizione tramite le impostazioni del tuo telefono",
                          style: TextStyle(
                            fontFamily: 'Kulim Park',
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Color(0XFF616161),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "L’app la utilizzarà per agevolarti nella ricerca di servizi, altri punti di interesse e per garantirti elevati standard di sicurezza. ",
                          style: TextStyle(
                            fontFamily: 'Kulim Park',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Color(0XFF616161),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        SvgPicture.asset('assets/svg/location_active.svg'),
                        const SizedBox(height: 35),
                        InkWell(
                          onTap: () {
                            setState(() {
                              layoutVisibility = false;
                            });
                            init(context);
                          },
                          child: const StandardButton(nameButton: 'Continua'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void init(BuildContext context) async {
    var check = await _handleLocationPermission();
    if (check) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderListScreen(),
        ),
        ModalRoute.withName('/'),
      );
      layoutVisibility = true;
    } else {
      setState(() {
        layoutVisibility = true;
      });
    }
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
