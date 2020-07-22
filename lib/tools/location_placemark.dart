import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPlacemark {
  double latitude;
  double longitude;

  Future<void> getPlacemarkLocation(String address) async {
    try {
      List<Placemark> placemark =
          await Geolocator().placemarkFromAddress(address);
      latitude = placemark[0].position.latitude;
      longitude = placemark[0].position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
