import 'dart:io';

import 'package:flutter/material.dart';

class SpaceLocation {
  final double latitude;
  final double longtitude;
  final String address;

  SpaceLocation({
    @required this.latitude,
    @required this.longtitude,
    @required this.address,
  });
}

class Space {
  final String id;
  final String title;
  final location;
  final File image;

  Space({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
