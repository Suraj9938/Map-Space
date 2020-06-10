import 'package:flutter/material.dart';
import 'package:mapspace/providers/map_spaces.dart';
import 'package:mapspace/screens/add_space_screen.dart';
import 'package:provider/provider.dart';

class SpaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Space"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddSpaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<MapSpace>(
        child: Center(
          child: const Text("No spaces added yet! Try adding some."),
        ),
        builder: (ctx, mapSpace, ch) => mapSpace.items.length <= 0
            ? ch
            : ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(mapSpace.items[index].image),
                  ),
                  title: Text(mapSpace.items[index].title),
                ),
          itemCount: mapSpace.items.length,
              ),
      ),
    );
  }
}
