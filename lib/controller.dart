import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var locationMessage = "Location not available".obs;

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationMessage.value = "Location services are disabled.";
        return;
      }

      // Request location permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationMessage.value = "Location permission denied.";
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        locationMessage.value = "Location permissions are permanently denied.";
        return;
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;
      locationMessage.value =
          "Latitude: ${latitude.value}, Longitude: ${longitude.value}";
    } catch (e) {
      locationMessage.value = "Error: ${e.toString()}";
    }
  }
}
