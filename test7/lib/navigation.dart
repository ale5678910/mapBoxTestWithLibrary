import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'UI/screen/loading_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen(this.waypoint, {super.key});

  final List<WayPoint> waypoint;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final bool _isMultipleStop = true;
  MapBoxNavigationViewController? _controller;
  bool cont = true;

  double? _distanceRemaining, _durationRemaining;
  bool _routeBuilt = false;
  bool _isNavigating = false;

  String? _instruction;

  MapBoxOptions opt = MapBoxOptions(
    language: "en",
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
    //initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> initialize() async {
    if (!mounted) return;
    MapBoxNavigation.instance.registerRouteEventListener(_onEmbeddedRouteEvent);
    //await MapBoxNavigation.instance.startNavigation(wayPoints: widget.waypoint, options: opt);
    await _controller?.buildRoute(wayPoints: widget.waypoint);
    //await _controller?.startNavigation(options: opt);
    setState(() {});
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
              //await _controller?.startNavigation(options: opt);
              //await MapBoxNavigation.instance.startNavigation(wayPoints: widget.waypoint, options: opt);
            },
          ),
          Visibility(
            visible: !_routeBuilt,
            child: const LoadingScreen(),
          ),
        ],
      ),
    );
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    _distanceRemaining = await MapBoxNavigation.instance.getDistanceRemaining();
    _durationRemaining = await MapBoxNavigation.instance.getDurationRemaining();

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {
          _instruction = progressEvent.currentStepInstruction;
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {
          _routeBuilt = true;
          //_controller?.startNavigation(options: opt);
        });
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {
          _routeBuilt = false;
        });
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
          setState(() {
            _controller?.finishNavigation();
            Navigator.pop(context);
          });
        }
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        Navigator.pop(context);
        setState(() {
          _routeBuilt = false;
          _isNavigating = false;
        });
        break;
      case MapBoxEvent.deliver_button_tap:
        showDialg();
        break;
      default:
        break;
    }
    setState(() {});
  }

  void showDialg() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
