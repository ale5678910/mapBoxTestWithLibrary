import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test7/point.dart';

class TestNavigation extends StatefulWidget {
  const TestNavigation({super.key});

  @override
  State<TestNavigation> createState() => _TestNavigationState();
}

class _TestNavigationState extends State<TestNavigation> {
  final Points points = Points();

  final bool _isMultipleStop = true;
  MapBoxNavigationViewController? _controller;

  late Position? currentPosition;

  double? _distanceRemaining, _durationRemaining;
  bool _routeBuilt = false;
  bool _isNavigating = false;

  MapBoxOptions opt = MapBoxOptions(
    language: "en",
    zoom: 13.0,
    tilt: 0.0,
    bearing: 0.0,
    simulateRoute: true,
    animateBuildRoute: true,
    voiceInstructionsEnabled: true,
    bannerInstructionsEnabled: true,
    units: VoiceUnits.metric,
    mode: MapBoxNavigationMode.drivingWithTraffic,
    isOptimized: true,
    allowsUTurnAtWayPoints: true,
    enableRefresh: true,
    longPressDestinationEnabled: false,
  );

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initialize();
    points.fillList();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> initialize() async {
    if (!mounted) return;
    MapBoxNavigation.instance.registerRouteEventListener(_onEmbeddedRouteEvent);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  var wayPoints = <WayPoint>[];
                  wayPoints.add(points.syncroweb);
                  wayPoints.add(points.gru);
                  _controller?.buildRoute(wayPoints: wayPoints);
                  _controller?.startNavigation(options: opt);
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business'),
                selected: _selectedIndex == 1,
                onTap: () {
                  setState(() {
                    opt.simulateRoute = false;
                  });
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('School'),
                selected: _selectedIndex == 2,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            MapBoxNavigationView(
              options: opt,
              onRouteEvent: _onEmbeddedRouteEvent,
              onCreated: (MapBoxNavigationViewController controller) async {
                _controller = controller;
              },
            ),
            /*Visibility(
              visible: _isNavigating,
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Image(
                      image: AssetImage("assets/not_done.png"),
                    ),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await MapBoxNavigation.instance.getDistanceRemaining();
    _durationRemaining = await MapBoxNavigation.instance.getDurationRemaining();

    switch (e.eventType) {
      case MapBoxEvent.values:
        setState(() {
          debugPrint(
              "values-------------------------------------------------------------------------------------------------------");
        });
      case MapBoxEvent.map_ready:
        debugPrint(
            "map_ready---------------------------------------------------------------------------------------------------------------");
      case MapBoxEvent.progress_change:
        setState(() {
          _isNavigating = true;
          debugPrint(
              "progress_change-------------------------------------------------------------------------------------------------------");
        });
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {
          debugPrint("-------------------leg-------${progressEvent.legIndex}----------------------");
        }
        break;
      case MapBoxEvent.route_building:
        setState(() {
          debugPrint(
              "route_building-------------------------------------------------------------------------------------------------------");
        });
      case MapBoxEvent.route_built:
        setState(() {
          debugPrint(
              "route_built-------------------------------------------------------------------------------------------------------");
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {});
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
          debugPrint(
              "navigation_running-------------------------------------------------------------------------------------------------------");
        });
        break;
      case MapBoxEvent.on_arrival:
        debugPrint(
            "on_arrival-------------------------------------------------------------------------------------------------------");
        debugPrint("case3-");
        if (!_isMultipleStop) {
          debugPrint("case4");
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {
          debugPrint("case1");
          setState(() {
          });
        }
        break;
      case MapBoxEvent.navigation_finished:
        setState(() {
          debugPrint(
              "navigation_finished-------------------------------------------------------------------------------------------------------");
        });
        debugPrint("case2");
      case MapBoxEvent.navigation_cancelled:
        setState(() {
          debugPrint(
              "navigation_cancelled-------------------------------------------------------------------------------------------------------");
        });
        break;
      default:
        break;
    }
    setState(() {});
  }
}
