import 'package:geolocator/geolocator.dart';
import '../../../../dependency_injection.dart';
import '../../../error/failures.dart';
import 'package:dartz/dartz.dart';
import '../datasources/local_datasource.dart';
import '../../domain/repositories/geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository{
  final LocalGeolocationDataSource dataSource;
  GeolocationRepositoryImpl() : dataSource = sl();

  @override
  Future<Either<Failure, LocationPermission>> checkPermission() async {
    try {
      var result = await dataSource.checkPermission();
      return Right(result);
    } on GeolocationFailure catch(e){
      return Left(e);
    }
  }

  @override
  Future openSettings() => dataSource.openSettings();

  @override
  Future<Either<Failure, Position>> getUserLocation() async{
    try{
      var location =  await dataSource.getUserLocation();
      return Right(location);
    } on GeolocationFailure catch(e){
      return Left(e);
    }
  } 
}