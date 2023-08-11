import 'package:location/location.dart';

class LocationFinder {

  Future<LocationData> getLocation() async {
    late  PermissionStatus permission;
    late bool serviceEnabled = false;
    // ignore: unused_local_variable
    late bool useCurrent = false;
    late LocationData position;

    var location = Location();
    permission = await location.hasPermission();
    if (permission == PermissionStatus.granted || permission == PermissionStatus.grantedLimited) {
      serviceEnabled = await location.serviceEnabled();
      if (serviceEnabled) {
        position = await location.getLocation();
        return position;
      } else {
        await location.requestService();
        position = await location.getLocation();
        return position;
      }
    } else {
      permission = await location.requestPermission();
      position = await location.getLocation();
      return position;
    }
  }
}