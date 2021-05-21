import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinta_weather_task/core/location/presentation/bloc/geo_location_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<GeoLocationBloc, GeoLocationState>(
        builder: (context, state) {
          return Container(
            height: height,
            width: width,
            child: Center(child: _getCenterWidget(state.status)),
          );
        },
      ),
    );
  }

  /// Return main widget based on status of location permission
  Widget _getCenterWidget(GeoStatus status){
    switch (status){
      case GeoStatus.approved:
        return Text('Approved');
      case GeoStatus.denied:
        return AskForPermissionScreen();
      default:
        return CircularProgressIndicator();
    }
  }
}

class AskForPermissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Hey, we need your location :) Pleasee'),
        TextButton(onPressed: () async {
         context.read<GeoLocationBloc>().add(OpenSettingsEvent());
        }, child: Text('Open settings'))
      ],
    );
  }
}

