// ignore_for_file: file_names

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Bank {
  String? bankname;
  String? address;
  double? rating;
  double? distance;
  LatLng? locationCoords;

  Bank({
    this.bankname,
    this.address,
    this.rating,
    this.distance,
    this.locationCoords,
  });
}

final List<Bank> banks = [
  Bank(
    bankname: 'BankX Branch',
    address: 'G-8, General Point, New York.',
    rating: 4.5,
    distance: 3.4,
    locationCoords: const LatLng(40.745803, -73.988213),
  ),
  Bank(
    bankname: 'BankX Yogi Point Branch',
    address: 'B-8, Yogi Point, New York.',
    rating: 3.5,
    distance: 3.5,
    locationCoords: const LatLng(40.751908, -73.989804),
  ),
  Bank(
    bankname: 'BankX Varachha Point Branch',
    address: 'G-5, Varachha Point, New York.',
    rating: 4.0,
    distance: 3.0,
    locationCoords: const LatLng(40.730148, -73.999639),
  ),
  Bank(
    bankname: 'BankX Sarthana Point Branch',
    address: 'J-4, Sarthana Point, New York.',
    rating: 4.5,
    distance: 3.6,
    locationCoords: const LatLng(40.729515, -73.985927),
  ),
];
