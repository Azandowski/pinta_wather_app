
import 'package:geolocator/geolocator.dart';

import '../../../error/failures.dart';

abstract class LocalGeolocationDataSource {
  Future<LocationPermission> checkPermission();
}

class LocalGeolocationDataSourceImpl implements LocalGeolocationDataSource{
  @override
  Future<LocationPermission> checkPermission() async{
    try {
      return await Geolocator.checkPermission();
    } catch(e){
      throw GeolocationFailure;
    }
  
  }

}