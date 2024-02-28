import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:intl/intl.dart';
import 'package:test7/delivery_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen(this.waypoint, {super.key});

  final List<WayPoint> waypoint;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final bool _isMultipleStop = true;
  MapBoxNavigationViewController? _controller;
  double? _distanceRemaining, _durationRemaining;
  bool _isNavigating = false;
  String currentTime = '';

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

  @override
  void initState() {
    super.initState();
    updateClock();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapBoxNavigationView(
            options: opt,
            onRouteEvent: _onEmbeddedRouteEvent,
            onCreated: (MapBoxNavigationViewController controller) async {
              _controller = controller;
              _controller?.buildRoute(wayPoints: widget.waypoint);
              _controller?.startNavigation(options: opt);
            },
          ),
          Visibility(
            visible: _isNavigating,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 100,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DeliveryScreen(),
                            ),
                          );
                        },
                        child: const Image(
                          image: AssetImage("assets/button.png"),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          setDistance(_distanceRemaining),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "${setDuration(_durationRemaining)}  $currentTime",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: () {
                          _controller?.finishNavigation();
                          Navigator.pop(context);
                        },
                        child: const Image(
                          image: AssetImage("assets/close.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await _controller?.distanceRemaining;
    _durationRemaining = await _controller?.durationRemaining;

    switch (e.eventType) {
      case MapBoxEvent.values:
      case MapBoxEvent.map_ready:
      case MapBoxEvent.progress_change:
        setState(() {
          _isNavigating = true;
        });
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {}
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        break;
      case MapBoxEvent.route_build_failed:
        break;
      case MapBoxEvent.navigation_running:
        setState(() {
          _isNavigating = true;
        });
        break;
      case MapBoxEvent.on_arrival:
        if (!_isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller?.finishNavigation();
        } else {
          setState(() {});
        }
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        break;
      default:
        break;
    }
    setState(() {});
  }

  String setDistance(double? distance) {
    var res = "";
    if (distance != null) {
      if (distance > 1000) {
        res = "${(distance / 100).round() / 10} km";
      }
      if (distance < 1000) {
        res = "${(distance / 100).round() * 100} m";
      }
    }
    return res;
  }

  String setDuration(double? duration) {
    var res = "";
    if (duration != null) {
      if (duration > 60) {
        res = "${(duration / 60).round()} min";
      } else {
        res = " < 1 min";
      }
      if (duration == 0) {
        res = "0 min";
      }
    }
    return res;
  }

  void updateClock() {
    setState(() {
      if (_durationRemaining != null) {
        currentTime = DateFormat.Hm().format(
            DateTime.now().add(Duration(seconds: _durationRemaining!.round())));
      }
    });
    Future.delayed(const Duration(seconds: 1), updateClock);
  }
}
