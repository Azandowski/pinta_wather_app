import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/error/failures.dart';


abstract class GeolocationRepository {
  Future<Either<Failure, LocationPermission>> checkPermission();
  Future openSettings();
  Future<Either<Failure, Position>> getUserLocation();
}