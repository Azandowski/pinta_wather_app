part of 'geo_location_bloc.dart';

enum GeoStatus {denied, approved, unknown}

class GeoLocationState extends Equatable {
  const GeoLocationState._({
    this.status = GeoStatus.unknown,
  });

  const GeoLocationState.unknown() : this._();

  const GeoLocationState.approved()
      : this._(status: GeoStatus.approved,);

  const GeoLocationState.denied()
      : this._(status: GeoStatus.denied);

  final GeoStatus status;

  @override
  List<Object> get props => [status];
}
