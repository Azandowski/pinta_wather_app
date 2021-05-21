part of 'geo_location_bloc.dart';

abstract class GeoLocationEvent extends Equatable {
  const GeoLocationEvent();

  @override
  List<Object> get props => [];
}

class GeoCheckPermission extends GeoLocationEvent{}

class OpenSettingsEvent extends GeoLocationEvent{}