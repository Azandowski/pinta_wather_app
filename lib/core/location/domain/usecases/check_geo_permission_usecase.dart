import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pinta_weather_task/core/location/domain/repositories/geolocation_repository.dart';
import 'package:pinta_weather_task/dependency_injection.dart';
import '../../../usecases/use_case_core.dart';

import '../../../error/failures.dart';

class CheckGeoPermission implements CoreFutureNoneParamUseCase<void> {
  final GeolocationRepository repository;

  CheckGeoPermission() : repository = sl();

  @override
  Future<Either<Failure, LocationPermission>> call() async {
    return await repository.checkPermission();
  }
}

