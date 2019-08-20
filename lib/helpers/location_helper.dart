
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng _MapCenter = LatLng(17.421098, 78.344263);

class LocationHelper {

  static LatLng mapCenter(){
    return _MapCenter;
  }
}