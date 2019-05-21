import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:media_player/app_localization/app_localization.dart';
import 'package:media_player/model/track_model.dart';
import 'dart:convert';
import 'package:menu/menu.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
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
                    Text(
                      _list[index].title,
                      style: trackTitleTextStyle,
                    ),
                    Text(
                      AppLocalizations.of(context).title,
                      style: trackSubtitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            Align(
              child: Menu(
                clickType: ClickType.click,
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  child: Icon(Icons.more_vert),
                ),
                items: [
                  MenuItem("copy", () {print('${AppLocalizations.of(context).debug}Copy item Tapped\n\n');}),
                  MenuItem("add", (){print('${AppLocalizations.of(context).debug}Add item Tapped\n\n');}),
                ],
              ),


//              Icon(
//                Icons.more_vert,
//                color: primaryIconColor,
//              ),
              alignment: Alignment.centerRight,
            )
          ],
        ),
        onTap: (){
          print('${AppLocalizations.of(context).debug}${_list[index].id} item Tapped\n\n');
        },
      ),
    );
  }
//  _listTileItem() {
//    return Container(
//      margin: EdgeInsets.all(8.0),
//      padding: EdgeInsets.all(5.0),
////      decoration: BoxDecoration(color: customWhite,borderRadius: BorderRadius.all(Radius.circular(8.0))),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        mainAxisSize: MainAxisSize.max,
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.only(right: 8.0),
//                child:
//                    /// use ImageNetwork instead of icon
//                    Icon(
//                  Icons.album,
//                  color: primaryIconColor,
//                ),
//              ),
//              Column(
//                children: <Widget>[
//                  Text(
//                    ${AppLocalizations.of(context).title},
//                    style: trackTitleTextStyle,
//                  ),
//                  Text(
//                    'Track Album',
//                    style: trackSubtitleTextStyle,
//                  ),
//                ],
//              ),
//            ],
//          ),
//          Align(
//            child: Icon(
//              Icons.more_vert,
//              color: primaryIconColor,
//            ),
//            alignment: Alignment.centerRight,
//          )
//        ],
//      ),
//    );
//  }


  // request http data
  Future<String> getTracks() async {
    List<TrackData> tracksData = List();

    var response = await http
        .get(Uri.encodeFull(tracksURL), headers: {
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

      tracksData.forEach((t){
        print('${AppLocalizations.of(context).debug}${t.title}\n\n');
      });

      setState(() {
        _list = tracksData;
      });
      print('${AppLocalizations.of(context).debug} $dataContent\n\n');
//    print('${AppLocalizations.of(context).debug}${tracksData.length}\n\n');

      return '';
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
