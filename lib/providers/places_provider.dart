import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/models/place_location.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: PlaceLocation(latitude: 12, longitude: 12),
      image: image,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
