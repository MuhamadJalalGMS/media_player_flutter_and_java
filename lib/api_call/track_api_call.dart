import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:media_player/model/track_model.dart';

Future<List<TrackData>> getTracks() async {
  List<TrackData> tracksData = List();

  var response = await http
      .get(Uri.encodeFull('https://hassanabdelwahab.naghmaty.app/api/tracks'), headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  });

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    List<dynamic> dataContent = json.decode(response.body)['data'];
    dataContent.forEach((item) {
      tracksData.add(TrackData.fromJson(item));
//      print('Tracks List dataContent : ${TrackData.fromJson(item).title}\n\n');
    });

    tracksData.forEach((t){
      print('Tracks Fucking data : ${t.title}\n\n');
    });

      print('Tracks List dataContent : $dataContent\n\n');
//    print('Tracks List tracksData : ${tracksData.length}\n\n');

    return tracksData;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
