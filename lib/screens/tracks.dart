import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:media_player/app_localization/app_localization.dart';
import 'package:media_player/model/track_model.dart';
import 'package:media_player/screens/player.dart';

import '../values.dart';

class tracksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _tracksState();
}

class _tracksState extends State<tracksScreen> {
  /// create a constructor and set its parameter to be a list of the tracks which
  /// was retrieved from the main screen
  /// @tracksList

  List<TrackData> _list = List();

  @override
  void initState() {
    super.initState();
    getTracks();
  }

  @override
  Widget build(BuildContext context) {
    print('${AppLocalizations.of(context).debug}${_list.length}');
    return Scaffold(
//      backgroundColor: primaryPurple,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => _listTileItem(index),
        itemCount: _list == null ? 0 : _list.length,
      ),
    );
  }

  /// set an object of trackModel to _listTileItem() as a parameter
  _listTileItem(int index) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(5.0),
//      decoration: BoxDecoration(color: customWhite,borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child:

                  /// use ImageNetwork instead of icon
                  Icon(
                Icons.album,
                color: primaryIconColor,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.60,
                  child: Text(
                    _list[index].title,
                    style: trackTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).title,
                  style: trackSubtitleTextStyle,
                  maxLines: 2,
                ),
              ],
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                _alertDialog(context);
                print('${AppLocalizations.of(context).debug} item Tapped\n\n');
              },
              child: Icon(
                Icons.more_vert,
                color: primaryIconColor,
                size: 35,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TrackPlayer(_list)));
          print(
              '${AppLocalizations.of(context).debug}${_list[index].url} item Tapped\n\n');
        },
      ),
    );
  }

  // request http data
  Future<String> getTracks() async {
    List<TrackData> tracksData = List();

    var response = await http.get(Uri.encodeFull(tracksURL), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      List<dynamic> dataContent = json.decode(response.body)['data'];
      dataContent.forEach((item) {
        tracksData.add(TrackData.fromJson(item));
//      print('${AppLocalizations.of(context).debug}${TrackData.fromJson(item).title}\n\n');
      });

      tracksData.forEach((t) {
        print('${AppLocalizations.of(context).debug}${t.title}\n\n');
      });

      setState(() {
        _list = tracksData;
      });
      print('${AppLocalizations.of(context).debug} $dataContent\n\n');

      return '';
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  // popup more items for track
  _alertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      _popupItemClick('phonelink_ring');
                    },
                    icon: Icon(
                      Icons.phonelink_ring,
                      color: primaryIconColor,
                    ),
                    label: Text('')),
                FlatButton.icon(
                    onPressed: () {
                      _popupItemClick('share');
                    },
                    icon: Icon(
                      Icons.share,
                      color: primaryIconColor,
                    ),
                    label: Text('')),
                FlatButton.icon(
                    onPressed: () {
                      _popupItemClick('file_download');
                    },
                    icon: Icon(
                      Icons.file_download,
                      color: primaryIconColor,
                    ),
                    label: Text('')),
              ],
            ),
            contentPadding: EdgeInsets.all(0.0),
          );
        });
  }

  // todo add on more track item's click listener
  void _popupItemClick(String buttonLabel) {
    print('${AppLocalizations.of(context).debug}$buttonLabel');
    Navigator.of(context).pop();
  }

// instantiate Player
}
