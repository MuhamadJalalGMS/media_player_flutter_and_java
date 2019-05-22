import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:media_player/model/album_model.dart';
import 'package:http/http.dart' as http;

import '../values.dart';

class albumsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _albumsState();
}

class _albumsState extends State<albumsScreen> {
  /// create a constructor and set its parameter to be a list of the tracks which
  /// was retrieved from the main screen
  /// @tracksList
  List<AlbumData> _list = List();

  @override
  void initState() {
    super.initState();
    getTracks();
  }

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
          itemBuilder: (BuildContext context, int index) =>
              _listTileItem(index),
          itemCount: _list == null ? 0 : _list.length,
        ),
      ),
    );
  }

  /// set an object of trackModel to _listTileItem() as a parameter
  _listTileItem(int index) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(_list[index].imageUrl),fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.bottomCenter,
      child: Text(
        _list[index].title,
        style: albumTitleTextStyle,
      ),
    );
  }

  // request http data
  Future<String> getTracks() async {
    List<AlbumData> albumsData = List();

    var response = await http.get(Uri.encodeFull(albumsURL), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      List<dynamic> dataContent = json.decode(response.body)['data'];
      dataContent.forEach((item) {
        albumsData.add(AlbumData.fromJson(item));
      });

      setState(() {
        _list = albumsData;
      });

      return '';
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
