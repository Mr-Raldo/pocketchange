// ignore_for_file: file_names

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ATM {
  String? bankname;
  String? address;
  double? rating;
  double? distance;
  LatLng? locationCoords;

  ATM({
    this.bankname,
    this.address,
    this.rating,
    this.distance,
    this.locationCoords,
  });
}

final List<ATM> atms = [
  ATM(
    bankname: 'BankX ATM',
    address: 'G-3, General Point, New York.',
    rating: 4.0,
    distance: 3.5,
    locationCoords: const LatLng(40.745803, -73.988213),
  ),
  ATM(
    bankname: 'BankX Yogi Point ATM',
    address: 'G-8, Yogi Point, New York.',
    rating: 4.5,
    distance: 3.0,
    locationCoords: const LatLng(40.751908, -73.989804),
  ),
  ATM(
    bankname: 'BankX Varachha Point ATM',
    address: 'B-8, Varachha Point, New York.',
    rating: 5.0,
    distance: 4.5,
    locationCoords: const LatLng(40.730148, -73.999639),
  ),
  ATM(
    bankname: 'BankX Sarthana Point ATM',
    address: 'K-9, Sarthana Point, New York.',
    rating: 3.5,
    distance: 3.5,
    locationCoords: const LatLng(40.729515, -73.985927),
  ),
];
