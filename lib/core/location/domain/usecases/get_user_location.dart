import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pinta_weather_task/core/error/failures.dart';
import 'package:pinta_weather_task/core/location/domain/repositories/geolocation_repository.dart';
import 'package:pinta_weather_task/dependency_injection.dart';
import '../../../usecases/use_case_core.dart';


class GetUserLocation implements CoreFutureNoneParamUseCase<void> {
  final GeolocationRepository repository;

  GetUserLocation() : repository = sl();

  @override
  Future<Either<Failure, Position>> call() async {
    return await repository.getUserLocation();
  }
}

