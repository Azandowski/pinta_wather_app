import 'package:pinta_weather_task/core/location/domain/repositories/geolocation_repository.dart';
import 'package:pinta_weather_task/dependency_injection.dart';
import '../../../usecases/use_case_core.dart';


class OpenSettings implements CoreFutureNoneParamUseCase<void> {
  final GeolocationRepository repository;

  OpenSettings() : repository = sl();

  @override
  Future call() async {
    return await repository.openSettings();
  }
}

