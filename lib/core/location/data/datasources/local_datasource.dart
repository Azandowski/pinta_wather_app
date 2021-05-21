
import 'package:geolocator/geolocator.dart';

import '../../../error/failures.dart';

abstract class LocalGeolocationDataSource {
  Future<LocationPermission> checkPermission();
  Future openSettings();
  Future<Position> getUserLocation();
}

class LocalGeolocationDataSourceImpl implements LocalGeolocationDataSource{
  @override
  Future<LocationPermission> checkPermission() async{
    try {
      var result = await Geolocator.checkPermission();

      if(result == LocationPermission.denied){
        result = await Geolocator.requestPermission();
      }

      return result;
    } catch(e){
      throw GeolocationFailure;
    }
  
  }

  @override
  Future openSettings() => Geolocator.openAppSettings();

  @override
  Future<Position> getUserLocation() async {
    try{
      return await Geolocator.getCurrentPosition();
    }catch (e){
      throw GeolocationFailure;
    }
  }

}