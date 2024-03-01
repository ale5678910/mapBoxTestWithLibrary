import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test7/UI/screen/login_screen.dart';
import 'package:test7/UI/screen/order_list_screen.dart';
import 'package:test7/camera_test.dart';
import 'package:test7/point.dart';
import 'package:test7/qr_scan_screen.dart';
import 'package:test7/test1.dart';
import 'package:test7/test2.dart';
import 'navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.camera});
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A550)),
        useMaterial3: true,
      ),
      home: MyHomePage(camera: camera),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.camera});
  final CameraDescription camera;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Points points = Points();
  bool isLocationServiceEnabled = false;

  @override
  void initState() {
    super.initState();
    checkLocationService();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestNavigation(),
                    ),
                  );
                },
                child: const Text("Mappa1"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Test2(),
                    ),
                  );
                },
                child: const Text("Mappa2"),
              ),
              ElevatedButton(
                onPressed: () {
                  checkLocationService();
                  if (isLocationServiceEnabled) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavigationScreen([points.syncroweb, points.gru]),
                      ),
                    );
                  } else {
                    _showMyDialog();
                  }
                },
                child: const Text("Mappa3"),
              ),
              ElevatedButton(
                onPressed: () {
                  checkLocationService();
                  if (isLocationServiceEnabled) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraTest(camera: widget.camera),
                      ),
                    );
                  } else {
                    _showMyDialog();
                  }
                },
                child: const Text("CameraTest"),
              ),
              ElevatedButton(
                onPressed: () {
                  checkLocationService();
                  if (isLocationServiceEnabled) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QRScanScreen(),
                      ),
                    );
                  } else {
                    _showMyDialog();
                  }
                },
                child: const Text("qrscan"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderListScreen(),
                    ),
                  );
                },
                child: const Text("orderlist"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text("login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    setState(() {
      isLocationServiceEnabled = serviceEnabled;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
