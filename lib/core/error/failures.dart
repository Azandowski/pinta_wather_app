import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'location_failure.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({@required this.message});

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({@required message}) : super(message: message);
}

class StorageFailure extends Failure {
  final message;
  StorageFailure({this.message}) : super(message: null);
}

class ConnectionFailure extends Failure {
  ConnectionFailure() : super(message: 'no_connection');
}

class GeolocationFailure extends Failure {
  final LocationFailure failure;

  GeolocationFailure(this.failure) : super(message: failure.message);
}


abstract class FailureMessages {
  static String get noConnection => "No internet connection";
}


