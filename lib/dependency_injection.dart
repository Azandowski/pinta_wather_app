import 'package:get_it/get_it.dart';
import 'package:pinta_weather_task/core/location/data/datasources/local_datasource.dart';
import 'package:pinta_weather_task/core/location/data/repositories/geolocation_repository_impl.dart';
import 'package:pinta_weather_task/core/location/domain/repositories/geolocation_repository.dart';
import 'package:pinta_weather_task/core/location/domain/usecases/check_geo_permission_usecase.dart';
import 'package:pinta_weather_task/core/location/domain/usecases/get_user_location.dart';
import 'package:pinta_weather_task/core/location/domain/usecases/open_settings.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initUseCases();
  _initRepositories();
  _initDataSources();
}

void _initUseCases(){
  sl.registerLazySingleton(() => CheckGeoPermission());
  sl.registerLazySingleton(() => OpenSettings());
  sl.registerSingleton(() => GetUserLocation());
}

void _initRepositories(){
  sl.registerLazySingleton<GeolocationRepository>(
    () => GeolocationRepositoryImpl(),
  );
}

void _initDataSources(){
  sl.registerLazySingleton<LocalGeolocationDataSource>(
    () => LocalGeolocationDataSourceImpl(),
  );
}
