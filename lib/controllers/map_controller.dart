import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  List<Marker> allMarkers = <Marker>[].obs;
  late GoogleMapController googleMapController;
  void addMarker(LatLng pos) async {
    if (allMarkers.isEmpty) {
      allMarkers.add(Marker(
        markerId: const MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'Origin'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
        consumeTapEvents: true,
        onTap: () {
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: pos, zoom: 12.5)));
        },
      ));
    } else if (allMarkers.length == 1) {
      allMarkers.add(Marker(
        markerId: const MarkerId('destination'),
        infoWindow: const InfoWindow(title: 'Destination'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: pos,
        consumeTapEvents: true,
        onTap: () {
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: pos, zoom: 12.5)));
        },
      ));
    }
  }

  @override
  void onReady() {}
}
