import 'package:flutter/material.dart';

import '../values.dart';

class albumsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _albumsState();
}

class _albumsState extends State<albumsScreen> {
  /// create a constructor and set its parameter to be a list of the tracks which
  /// was retrieved from the main screen
  /// @tracksList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) => _listTileItem(),
          itemCount: 50,
        ),
      ),
    );
  }

  /// set an object of trackModel to _listTileItem() as a parameter
  _listTileItem() {
    return Container(
      decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.bottomCenter,
      child: Text(
        'Album Title',
        style: albumTitleTextStyle,
      ),
    );
  }
}
