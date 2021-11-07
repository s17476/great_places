import 'package:flutter/material.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl = '';

  Future<void> _getCurrentLocation() async {
    final loc = await Location().getLocation();
    // print(loc.toString());
    final previewUrl = LocationHelper.genarateLocationPreviewImage(
      latitude: loc.latitude!,
      longitude: loc.longitude!,
    );
    setState(() {
      _previewImageUrl = previewUrl;
    });
  }

  Future<void> selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
      (MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapScreen(
          isSelecting: true,
        ),
      )),
    );
    if (selectedLocation == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _previewImageUrl.isEmpty
              ? const Text('No location choosen')
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current location'),
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            ),
            TextButton.icon(
              onPressed: selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Select on map'),
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            ),
          ],
        )
      ],
    );
  }
}
