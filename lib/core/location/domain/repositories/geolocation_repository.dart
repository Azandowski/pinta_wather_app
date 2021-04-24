import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../../../usecases/use_case_core.dart';
import '../../../../core/error/failures.dart';


abstract class GeolocationRepository {
  Future<Either<Failure, LocationPermission>> checkPermission(NoParams params);
}