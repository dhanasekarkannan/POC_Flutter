import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as prefix0;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

import '../helpers/location_helper.dart';
import 'main_drawer.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageURL;
  LatLng _currentLocation;
  LatLng _orginLocation;
   Geolocator _geolocator;

  @override
  void initState() {
    super.initState();

    _geolocator = Geolocator();
    _orginLocation = LocationHelper.mapCenter();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    
    try {
      final locData = await _geolocator.getCurrentPosition(
          desiredAccuracy: prefix0.LocationAccuracy.best);
      print(locData.latitude);
      print(locData.longitude);
      setState(() {
        _currentLocation = LatLng(locData.latitude, locData.longitude);
      });
    } catch (e) {
      print('origin location ${_orginLocation.latitude}, ${_orginLocation.longitude}');
      _currentLocation = _orginLocation;
    }
  }

  void _onCheckinPressed() async {
          print('origin location ${_orginLocation.latitude}, ${_orginLocation.longitude}');

    try {
      double distanceInMeters = await _geolocator.distanceBetween(_orginLocation.latitude,
          _orginLocation.longitude, _currentLocation.latitude, _currentLocation.longitude);
      
      print("Distance between you and office is $distanceInMeters meters");
      showDialog(context: context, builder: (BuildContext context){
         return AlertDialog(
        title: Text('Alert'),
        content: Text("Distance between you and office is ${distanceInMeters.toStringAsFixed(2)} meters"),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ); 
      });
      

    } catch (e) {
      print('Error in calculating Distance:');
    }
  }

  void _checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
    });
    _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    _geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: _currentLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue( BitmapDescriptor.hueAzure),
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: _orginLocation,
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check-In'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: _currentLocation == null
                ? CircularProgressIndicator()
                : Container(
                    height: 170,
                    child: GoogleMap(
                      markers: _createMarker(),
                      initialCameraPosition:
                          CameraPosition(zoom: 16, target: _currentLocation),
                    ),
                    color: Colors.blue,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person_pin_circle),
                onPressed: _onCheckinPressed,
                label: Text('check in'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.person_pin_circle),
                onPressed: () {},
                label: Text('check out'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
