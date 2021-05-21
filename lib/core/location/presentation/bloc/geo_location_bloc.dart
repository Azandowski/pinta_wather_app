import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pinta_weather_task/core/error/failures.dart';
import 'package:pinta_weather_task/core/location/domain/usecases/check_geo_permission_usecase.dart';
import 'package:pinta_weather_task/core/location/domain/usecases/get_user_location.dart';
import 'package:pinta_weather_task/core/location/domain/usecases/open_settings.dart';

part 'geo_location_event.dart';
part 'geo_location_state.dart';

class GeoLocationBloc extends Bloc<GeoLocationEvent, GeoLocationState> {
  final CheckGeoPermission checkGeoPermission;
  final OpenSettings openSettings;
  final GetUserLocation getUserLocation;
  GeoLocationBloc({
    @required this.checkGeoPermission,
    @required this.openSettings,
    @required this.getUserLocation,
  }) : super(GeoLocationState.unknown()){
    this.add(GeoCheckPermission());
  }

  @override
  Stream<GeoLocationState> mapEventToState(
    GeoLocationEvent event,
  ) async* {
    if(event is GeoCheckPermission){
      var result =  await checkGeoPermission();
      yield _mapPermissionStatusToState(result);
    }else if(event is OpenSettingsEvent){
      openSettings();
    }
  }

  GeoLocationState _mapPermissionStatusToState(Either<Failure, LocationPermission> result){
    return result.fold((error) => GeoLocationState.denied(), (status) {
      switch (status) {
        case LocationPermission.always:
          return GeoLocationState.approved();
        case LocationPermission.whileInUse:
          return GeoLocationState.approved();
        default:
          return GeoLocationState.denied();
      }
    });
  }

}
