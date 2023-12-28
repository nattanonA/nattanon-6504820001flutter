import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition position = CameraPosition(
    target: LatLng(13.721472048893629, 100.4536374716403), //
    zoom: 24,
  );
  _openGoogleMapApp(double lat, double long) async {
    Uri url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not lunch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Map Page'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: <Marker>[
          Marker(
              markerId: MarkerId('Computer Science@SIAM-U'),
              position: LatLng(13.720455482780064, 100.45313092208451),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRose),
              infoWindow:
                  InfoWindow(title: 'I am work at here', snippet: 'Hide out'),
              onTap: () {
                _openGoogleMapApp(13.788109303473627, 100.54863446761962);
              }
              ),
          
        ].toSet(),
        initialCameraPosition: position,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      )
    );
  }
}