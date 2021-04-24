import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pinta_weather_task/core/error/failures.dart';
import 'package:pinta_weather_task/core/location/domain/usecases/check_geo_permission_usecase.dart';
import 'package:pinta_weather_task/core/usecases/use_case_core.dart';

part 'geo_location_event.dart';
part 'geo_location_state.dart';

class GeoLocationBloc extends Bloc<GeoLocationEvent, GeoLocationState> {
  final CheckGeoPermission checkGeoPermission;
  GeoLocationBloc({
    @required this.checkGeoPermission,
  }) : super(GeoLocationState.unknown()){
    this.add(GeoCheckPermission());
  }

  @override
  Stream<GeoLocationState> mapEventToState(
    GeoLocationEvent event,
  ) async* {
    if(event is GeoCheckPermission){
      var result =  await checkGeoPermission(NoParams());
      yield _mapPermissionStatusToState(result);
    }
  }

  GeoLocationState _mapPermissionStatusToState(Either<Failure, LocationPermission> result){
    result.fold((error) => GeoLocationState.denied(), (status) {
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
