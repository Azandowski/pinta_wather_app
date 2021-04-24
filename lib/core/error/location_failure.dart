enum LocationFailure { 
  permissionDenied, locationDisabled
}

extension LocationFailureExtension on LocationFailure {
  String get message {
    switch (this) {
      case LocationFailure.permissionDenied:
        return 'permissionDenied';
      case LocationFailure.locationDisabled:
        return "locationDisabled";
    }
  }
}