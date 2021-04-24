import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinta_weather_task/core/location/presentation/bloc/geo_location_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeoLocationBloc, GeoLocationState>(
        builder: (context, state) {
          return Column(
              children: [
                
              ],
          );
        },
      ),
    );
  }
}