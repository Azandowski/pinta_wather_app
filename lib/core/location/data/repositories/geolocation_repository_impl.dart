import 'package:geolocator/geolocator.dart';
import '../../../error/failures.dart';
import 'package:dartz/dartz.dart';
import '../datasources/local_datasource.dart';
import '../../domain/repositories/geolocation_repository.dart';
import '../../../usecases/use_case_core.dart';
import '../../../../dependency_injection.dart';

class GeolocationRepositoryImpl implements GeolocationRepository{
  final LocalGeolocationDataSource dataSource;
  GeolocationRepositoryImpl() : dataSource = sl();

  @override
  Future<Either<Failure, LocationPermission>> checkPermission(NoParams params) async {
    try {
      var result = await dataSource.checkPermission();
      return Right(result);
    } on GeolocationFailure catch(e){
      return Left(e);
    }
  }

}