//class TrackInfo {
//  List<TrackData> trackData;
//  TrackLinks links;
//  TrackMeta meta;
//
//  TrackInfo(this.trackData, this.links, this.meta);
//  factory TrackInfo.fromJson(Map<String, dynamic> json) {
//    print('Tracks List Data fromJson : $json');
//    return TrackInfo(json['trackData'], json['links'], json['meta']);
//  }
//}

class TrackData {
  int id;
  String title;
  String url;
  String ringtone;
  String vodafone;
  String orange;
  String etisalat;

  TrackData(this.id, this.title, this.url, this.ringtone, this.vodafone,
      this.orange, this.etisalat);

  factory TrackData.fromJson(Map<String, dynamic> json) {
//    print('Tracks List Data fromJson : $json');
    return TrackData(json['id'], json['title'], json['url'], json['ringtone'],
        json['vodafone'], json['orange'], json['etisalat']);
  }
}

class TrackLinks {
  String first;
  String last;
  String prev;
  String next;

  TrackLinks(this.first, this.last, this.prev, this.next);
}

class TrackMeta {
  int current_page;
  int from;
  int last_page;
  String path;
  int per_page;
  int to;
  int total;

  TrackMeta(this.current_page, this.from, this.last_page, this.path,
      this.per_page, this.to, this.total);
}
