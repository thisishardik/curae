import 'dart:math';

import 'package:biocom2/tools/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:permission/permission.dart';
import 'package:location/location.dart' as location_services;

class NavigateToDoctor extends StatefulWidget {
  static String id = 'navigate_to_doctor';

  String originName;
  String destinationName;
  double originLatitude;
  double originLongitude;
  double destinationLatitude;
  double destinationLongitude;

  NavigateToDoctor(
      {this.destinationName,
      this.originName,
      this.originLongitude,
      this.destinationLatitude,
      this.destinationLongitude,
      this.originLatitude});

  @override
  _NavigateToDoctorState createState() => _NavigateToDoctorState();
}

class _NavigateToDoctorState extends State<NavigateToDoctor> {
  bool showSpinner = false;

  final Set<Polyline> polyline = {};

  GoogleMapController _controller;
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyBmLO8OGu4WRYOKx99XsN_b7rtX7t2e0uo");

  getSomePoints() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
      var askPermissions =
          await Permission.requestPermissions([PermissionName.Location]);
    } else {
      routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(widget.originLatitude, widget.originLongitude),
          destination:
              LatLng(widget.destinationLatitude, widget.destinationLongitude),
          mode: RouteMode.driving);
    }
  }

  getAddressPoints() async {
    routeCoords = await googleMapPolyline.getPolylineCoordinatesWithAddress(
        origin: widget.originName,
        destination: widget.destinationName,
        mode: RouteMode.driving);
  }

  @override
  void initState() {
    super.initState();
    getAddressPoints();
  }

  List<Marker> markers = [];
//  static LatLng initialPosition;

//  void getUserInitialLocation() async {
//    Position position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//    List<Placemark> placemark = await Geolocator()
//        .placemarkFromCoordinates(position.latitude, position.longitude);
//    setState(() {
//      initialPosition = LatLng(position.latitude, position.longitude);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          iconTheme: IconThemeData(size: 30.0, color: Colors.black87),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 27.0,
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            IconButton(
              // ToDo Add notification dot. Put them in a stack and use positioned for placement
              icon: Icon(
                Icons.notifications,
                color: Colors.black87,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black87,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(35.0),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Text(
                  'Lucknow, Uttar Pradesh',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.5),
                ),
              ],
            ),
          ),
        ),
        body: GoogleMap(
          polylines: polyline,
          myLocationEnabled: true,
          mapToolbarEnabled: true,
          myLocationButtonEnabled: true,
          markers: markers.toSet(),
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            zoom: 5.0,
            target: LatLng(20.5937, 78.9629),
          ),
          mapType: MapType.normal,
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    int id = Random().nextInt(100);
    setState(
      () {
        showSpinner = false;
        _controller = controller;
        markers.add(
          Marker(
            infoWindow: InfoWindow(title: widget.destinationName, onTap: () {}),
            markerId: MarkerId(id.toString()),
            position:
                LatLng(widget.destinationLatitude, widget.destinationLongitude),
          ),
        );
        polyline.add(
          Polyline(
              polylineId: PolylineId('route1'),
              visible: true,
              points: routeCoords,
              width: 4,
              color: Colors.blue,
              startCap: Cap.roundCap,
              endCap: Cap.buttCap),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    markers = [];
  }
}

class InitialLocation {
  double initLatitude;
  double initLongitude;
  Future<void> getCurrentLocation(String address) async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      initLatitude = position.latitude;
      initLongitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
