const GOOGLE_API_KEY = 'AIzaSyDNqhEcOdvi9udPmkxf-68koJ4NaoZwuUs';

class LocationHelper {
  static String genarateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7C$latitude,$longitude&key=${GOOGLE_API_KEY}';
  }
}
