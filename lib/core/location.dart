import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Placemark> getLocation() async {
  // 🔐 Request permission
  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    throw Exception("Location permission denied");
  }

  // 📍 Get position
  Position position = await Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    ),
  );

  // 🌍 Convert to address
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  return placemarks.first;
}
