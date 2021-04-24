import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinta_weather_task/core/location/presentation/bloc/geo_location_bloc.dart';

import 'dependency_injection.dart';
import 'modules/main_module/presentation/pages/main_page.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GeoLocationBloc(checkGeoPermission: sl()))
      ],
        child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}