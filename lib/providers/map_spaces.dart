import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mapspace/helper/db_helper.dart';
import 'package:mapspace/model/space.dart';

class MapSpace with ChangeNotifier {
  List<Space> _items = [];

  List<Space> get items {
    return [..._items];
  }

  void addSpace(String pickedTitle, File pickedImage) {
    final newSpace = Space(
      id: DateTime.now().toString(),
      image: pickedImage,
      location: null,
      title: pickedTitle,
    );
    _items.add(newSpace);
    notifyListeners();
    DBHelper.insert("user_spaces", {
      'id': newSpace.id,
      'title': newSpace.title,
      'image': newSpace.image.path,
    });
  }

  // fetching data
  Future<void> fetchAndSetSpace() async {
    final dataList = await DBHelper.getData("user_spaces");
    _items = dataList
        .map((items) => Space(
              id: items['id'],
              title: items['title'],
              location: null,
              image: File(items['image']),
            ))
        .toList();
    notifyListeners();
  }
}
