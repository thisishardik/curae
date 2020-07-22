import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  double latitude;
  double longitude;
  double latitudeByPlacemark;
  double longitudeByPlacemark;
  List<Address> myLocation;

  Future<void> getCurrentLocation(String address) async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      latitude = position.latitude;
      longitude = position.longitude;

      myLocation = await Geocoder.local.findAddressesFromCoordinates(
          Coordinates(position.latitude, position.longitude));

      List<Placemark> placemark =
          await Geolocator().placemarkFromAddress(address);
      latitudeByPlacemark = placemark[0].position.latitude;
      longitudeByPlacemark = placemark[0].position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
