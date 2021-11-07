import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place_location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
    this.initialLocation =
        const PlaceLocation(latitude: 55.605060, longitude: 12.385479),
    this.isSelecting = false,
  }) : super(key: key);

  final PlaceLocation initialLocation;
  final bool isSelecting;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find position'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 15,
        ),
      ),
    );
  }
}
