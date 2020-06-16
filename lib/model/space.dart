import 'dart:io';

import 'package:flutter/material.dart';

class SpaceLocation {
  final double latitude;
  final double longtitude;
  final String address;

  const SpaceLocation({
    @required this.latitude,
    @required this.longtitude,
    this.address,
  });
}

class Space {
  final String id;
  final String title;
  final SpaceLocation location;
  final File image;

  Space({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
