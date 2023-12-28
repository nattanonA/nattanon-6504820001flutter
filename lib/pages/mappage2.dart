import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/models/team.dart';

class MapPage extends StatefulWidget {
  final double? teamLat;
  final double? teamLong;
  final TeamName? team;

  const MapPage({Key? key, this.teamLat, this.teamLong, this.team}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  late final CameraPosition position;

  @override
  void initState() {
    super.initState();
    if (widget.teamLat != null && widget.teamLong != null) {
      position = CameraPosition(
        target: LatLng(widget.teamLat!, widget.teamLong!),
        zoom: 15,
      );
    } else {
      // Use a fixed location if teamLat and teamLong are not provided
      position = CameraPosition(
        target: LatLng(13.721472048893629, 100.4536374716403),
        zoom: 24,
      );
    }
  }

  _openGoogleMapApp(double lat, double long) async {
    Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Team Detail: ${widget.team?.teamDetail}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Map Page'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: <Marker>[
          Marker(
            markerId: MarkerId('Team Detail'),
            position: LatLng(position.target.latitude, position.target.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
            infoWindow: InfoWindow(
              title: 'Team Detail',
              snippet: widget.team != null ? widget.team!.teamDetail ?? 'No details available' : 'Fixed Team Detail',
            ),
            onTap: () {
              if (widget.teamLat != null && widget.teamLong != null) {
                _openGoogleMapApp(widget.teamLat!, widget.teamLong!);
              }
            },
          ),
        ].toSet(),
        initialCameraPosition: position,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}