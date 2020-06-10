import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mapspace/model/space.dart';

class MapSpace with ChangeNotifier {
  List<Space> _items = [];

  List<Space> get items {
    return [..._items];
  }

  void addSpace(String pickedTitle, File pickedImage)
  {
    final newSpace = Space(
      id: DateTime.now().toString(),
      image: pickedImage,
      location: null,
      title: pickedTitle,
    );
    _items.add(newSpace);
    notifyListeners();
  }

}