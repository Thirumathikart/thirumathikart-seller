import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/map_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends GetView<MapController> {
  const MapPage({super.key});
  static const theinitialCameraPosition = CameraPosition(
    target: LatLng(10.790433, 78.704562),
    zoom: 12.5,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Map'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * (0.5),
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Obx(() => GoogleMap(
                        onMapCreated: (GoogleMapController mapController) {
                          controller.googleMapController = mapController;
                        },
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        initialCameraPosition: theinitialCameraPosition,
                        markers: Set<Marker>.of(controller.allMarkers),
                        onLongPress: controller.addMarker,
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.black,
                        onPressed: () =>
                            controller.googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                              theinitialCameraPosition),
                        ),
                        child: const Icon(Icons.center_focus_strong),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      top: 5.0, bottom: 5, left: 8, right: 8),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Buyer: R Sarvesh',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Delivery Address : Delhi',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Buyer Contact : 9999999999',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Product Name - Tomato ',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Seller: Sarvesh R',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Return Address: First Godown',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
