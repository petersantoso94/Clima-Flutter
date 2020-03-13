import 'package:geolocator/geolocator.dart';

class Location {
  double lat, long;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.long = position.longitude;
      this.lat = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
