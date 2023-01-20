
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';


class Model {
  const Model(this.country, this.latitude, this.longitude);

  final String country;
  final double latitude;
  final double longitude;
}

class DataModel {
  DataModel(this.from, this.to, this.color);

  final MapLatLng from;
  final MapLatLng to;
  final Color color;
}