import 'package:flutter/material.dart';
import 'package:media_player/app_localization/app_localization.dart';
class MoreItems extends StatelessWidget {
  List<String> _list;
  TextStyle _style = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    // initialize List
    initList(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          children: _buildList(),
        ),
      ),
    );
  }

  List<dynamic> _buildList() {
    return _list
        .map((routeName) => ListTile(
              title: Text(routeName, style: _style,),
              // handle list click listener
              onTap: () {},
            ))
        .toList();
  }

  // initialize List
  initList(BuildContext context) {
    _list = List();
    _list.add(AppLocalizations.of(context).photo);
    _list.add(AppLocalizations.of(context).downloads);
    _list.add(AppLocalizations.of(context).aboutArtist);
    _list.add(AppLocalizations.of(context).aboutCompany);
    _list.add(AppLocalizations.of(context).logout);
  }
}
