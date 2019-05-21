import 'package:flutter/material.dart';

import '../values.dart';

class videosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _videosState();
}

class _videosState extends State<videosScreen> {
  /// create a constructor and set its parameter to be a list of the tracks which
  /// was retrieved from the main screen
  /// @tracksList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => _listTileItem(),
          itemCount: 50,
        ),
      ),
    );
  }

  /// set an object of trackModel to _listTileItem() as a parameter
  _listTileItem() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.bottomCenter,
      child: Text(
        'Video Title',
        style: videosTitleTextStyle,
      ),
    );
  }
}
