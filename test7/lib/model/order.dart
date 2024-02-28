import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';

class Order {
  final int id;
  final String recipient;
  final WayPoint addressPoint;
  final String address;

  Order({
    required this.id,
    required this.recipient,
    required this.addressPoint,
    required this.address,
  });
}
