import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mapspace/helper/db_helper.dart';
import 'package:mapspace/helper/location_helper.dart';
import 'package:mapspace/model/space.dart';

class MapSpace with ChangeNotifier {
  List<Space> _items = [];

  List<Space> get items {
    return [..._items];
  }

  Future<void> addSpace(String pickedTitle, File pickedImage,
      SpaceLocation pickedLocation) async {
    final address = await LocationHelper.getSpaceAddress(
        pickedLocation.latitude, pickedLocation.longtitude);
    final updatedLocation = SpaceLocation(
      latitude: pickedLocation.latitude,
      longtitude: pickedLocation.longtitude,
      address: address,
    );
    print(address);
    final newSpace = Space(
      id: DateTime.now().toString(),
      image: pickedImage,
      location: updatedLocation,
      title: pickedTitle,
    );
    _items.add(newSpace);
    notifyListeners();
    DBHelper.insert("user_spaces", {
      'id': newSpace.id,
      'title': newSpace.title,
      'image': newSpace.image.path,
      'loc_lat' : newSpace.location.latitude,
      'loc_lng' : newSpace.location.longtitude,
      'address' : newSpace.location.address,
    });
  }

  // fetching data
  Future<void> fetchAndSetSpace() async {
    final dataList = await DBHelper.getData("user_spaces");
    _items = dataList
        .map((items) => Space(
              id: items['id'],
              title: items['title'],
              location: SpaceLocation(
                latitude: items['loc_lat'],
                longtitude: items['loc_lng'],
                address: items['address'],
              ),
              image: File(items['image']),
            ))
        .toList();
    notifyListeners();
  }

  //find by id
  Space findById(String id)
  {
    return _items.firstWhere((space) => space.id == id);
  }
}
